/* global wp */
(function () {
	'use strict';

	wp.customize.controlConstructor['ct-social-links'] = wp.customize.Control.extend({
		ready: function () {
			const control = this;
			const root = control.container[0];
			const list = root.querySelector('.ct-social-links-items');
			const add = root.querySelector('.ct-social-add');
			const labels = control.params.labels;
			const icons = control.params.icons || {};
			const template = root.querySelector('.ct-social-template');

			function update(save = true) {
				const rows = Array.from(list.children);
				rows.forEach(function (row, index) {
					row.querySelector('legend').textContent = labels.link.replace('%d', index + 1);
					row.querySelector('.ct-social-up').disabled = index === 0;
					row.querySelector('.ct-social-down').disabled = index === rows.length - 1;
				});
				if (save) {
					control.setting.set(rows.map(function (row) {
						return {
							title: row.querySelector('[data-field="title"]').value,
							url: row.querySelector('[data-field="url"]').value,
							icon: Number(row.dataset.icon) || 0,
						};
					}));
				}
			}

			function setIcon(row, id, url) {
				row.dataset.icon = id || 0;
				const image = row.querySelector('img');
				image.hidden = !url;
				if (url) image.src = url;
				else image.removeAttribute('src');
				row.querySelector('.ct-social-clear').disabled = !id;
			}

			function append(data) {
				const row = template.content.firstElementChild.cloneNode(true);
				row.querySelector('[data-field="title"]').value = data.title || '';
				row.querySelector('[data-field="url"]').value = data.url || '';
				setIcon(row, data.icon, icons[data.icon]);
				list.append(row);
				return row;
			}

			const value = control.setting.get();
			if (Array.isArray(value)) value.forEach(append);
			update(false);
			list.addEventListener('input', function () { update(); });
			add.addEventListener('click', function () {
				const row = append({});
				update();
				row.querySelector('input').focus();
			});
			list.addEventListener('click', function (event) {
				const button = event.target.closest('button');
				if (!button) return;
				const row = button.closest('.ct-social-row');
				if (button.classList.contains('ct-social-select')) {
					const frame = wp.media({ title: labels.select, button: { text: labels.use }, library: { type: 'image' }, multiple: false });
					frame.on('open', function () {
						if (Number(row.dataset.icon)) frame.state().get('selection').add(wp.media.attachment(Number(row.dataset.icon)));
					});
					frame.on('select', function () {
						const image = frame.state().get('selection').first().toJSON();
						setIcon(row, image.id, image.sizes && image.sizes.thumbnail ? image.sizes.thumbnail.url : image.url);
						update();
					});
					frame.on('close', function () { button.focus(); });
					frame.open();
					return;
				}
				if (button.classList.contains('ct-social-clear')) setIcon(row, 0, '');
				if (button.classList.contains('ct-social-remove')) {
					const next = row.nextElementSibling || row.previousElementSibling;
					row.remove();
					(next ? next.querySelector('input') : add).focus();
				}
				if (button.classList.contains('ct-social-up') && row.previousElementSibling) list.insertBefore(row, row.previousElementSibling);
				if (button.classList.contains('ct-social-down') && row.nextElementSibling) list.insertBefore(row.nextElementSibling, row);
				update();
				if (row.isConnected && button.disabled) row.querySelector('input').focus();
				root.querySelector('.ct-social-status').textContent = labels.updated;
			});
		},
	});
})();
