/* global jQuery, wp, ctHomepageSections */
jQuery(function ($) {
	'use strict';

	const box = $('.ct-homepage-sections');
	if (!box.length) {
		return;
	}
	const labels = ctHomepageSections;
	const tabs = box.find('[role="tab"]');
	function activateTab(tab) {
		tabs.attr({ 'aria-selected': 'false', tabindex: '-1' }).removeClass('nav-tab-active');
		$(tab).attr({ 'aria-selected': 'true', tabindex: '0' }).addClass('nav-tab-active');
		box.find('[role="tabpanel"]').prop('hidden', true);
		box.find('[role="tabpanel"]').filter(function () {
			return this.id === tab.getAttribute('aria-controls');
		}).prop('hidden', false);
	}
	tabs.on('click', function () { activateTab(this); });
	tabs.on('keydown', function (event) {
		const index = tabs.index(this);
		let next;
		if (event.key === 'ArrowRight') next = (index + 1) % tabs.length;
		if (event.key === 'ArrowLeft') next = (index - 1 + tabs.length) % tabs.length;
		if (event.key === 'Home') next = 0;
		if (event.key === 'End') next = tabs.length - 1;
		if (next !== undefined) {
			event.preventDefault();
			activateTab(tabs[next]);
			tabs[next].focus();
		}
	});

	box.on('click', '.ct-copy-shortcode', async function () {
		const status = $(this).siblings('.ct-copy-status');
		try {
			if (navigator.clipboard && window.isSecureContext) {
				await navigator.clipboard.writeText(this.dataset.shortcode);
			} else {
				const field = $('<textarea>').val(this.dataset.shortcode).appendTo(box);
				field[0].select();
				const copied = document.execCommand('copy');
				field.remove();
				this.focus();
				if (!copied) throw new Error('Copy failed');
			}
			status.text(labels.copied);
		} catch (error) {
			status.text(labels.copyFailed);
		}
	});

	const gallery = box.find('.ct-gallery-items');
	const status = box.find('.ct-gallery-status');
	function updateOrder() {
		const items = gallery.children();
		items.find('.ct-image-up').prop('disabled', false);
		items.find('.ct-image-down').prop('disabled', false);
		items.first().find('.ct-image-up').prop('disabled', true);
		items.last().find('.ct-image-down').prop('disabled', true);
	}
	gallery.sortable({
		items: '> li',
		cancel: 'button, input',
		tolerance: 'pointer',
		update: function () { updateOrder(); gallery.find('input').first().trigger('change'); }
	});
	gallery.on('click', 'button', function () {
		const item = $(this).closest('li');
		if ($(this).hasClass('ct-image-remove')) {
			const focusTarget = item.next().find('.ct-image-remove')[0] || item.prev().find('.ct-image-remove')[0] || box.find('.ct-gallery-select')[0];
			item.remove();
			focusTarget.focus();
		}
		if ($(this).hasClass('ct-image-up')) item.insertBefore(item.prev());
		if ($(this).hasClass('ct-image-down')) item.insertAfter(item.next());
		updateOrder();
		status.text('');
		box.find('.ct-gallery-select').trigger('change');
	});

	let frame;
	box.on('click', '.ct-gallery-select', function () {
		if (!frame) {
			frame = wp.media({ title: labels.select, button: { text: labels.use }, library: { type: 'image' }, multiple: true });
			frame.on('open', function () {
				const selection = frame.state().get('selection');
				selection.reset();
				gallery.children().each(function () { selection.add(wp.media.attachment(Number(this.dataset.id))); });
			});
			frame.on('select', function () {
				const images = frame.state().get('selection').toJSON();
				status.text('');
				gallery.empty();
				images.forEach(function (image) {
					const item = $('<li>', { class: 'ct-gallery-item', 'data-id': image.id });
					$('<img>', { src: image.sizes && image.sizes.thumbnail ? image.sizes.thumbnail.url : image.url, alt: image.alt || '' }).appendTo(item);
					$('<input>', { type: 'hidden', name: 'ct_homepage_sections[hero][gallery][]', value: image.id }).appendTo(item);
					const actions = $('<div>', { class: 'ct-gallery-actions' }).appendTo(item);
					$('<button>', { type: 'button', class: 'button ct-image-up', 'aria-label': labels.earlier, text: '←' }).appendTo(actions);
					$('<button>', { type: 'button', class: 'button ct-image-down', 'aria-label': labels.later, text: '→' }).appendTo(actions);
					$('<button>', { type: 'button', class: 'button ct-image-remove', text: labels.remove }).appendTo(actions);
					gallery.append(item);
				});
				updateOrder();
				box.find('.ct-gallery-select').trigger('change');
			});
		}
		frame.open();
	});
	updateOrder();
});
