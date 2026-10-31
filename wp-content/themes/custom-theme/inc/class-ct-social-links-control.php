<?php
/**
 * Customizer social links repeater.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

class CT_Social_Links_Control extends WP_Customize_Control {
	public $type = 'ct-social-links';

	public function enqueue() {
		wp_enqueue_media();
		$base = get_template_directory();
		wp_enqueue_script( 'ct-customizer-social-links', get_template_directory_uri() . '/assets/admin/customizer-social-links.js', array( 'customize-controls', 'media-editor' ), filemtime( $base . '/assets/admin/customizer-social-links.js' ), true );
		wp_enqueue_style( 'ct-customizer-social-links', get_template_directory_uri() . '/assets/admin/customizer-social-links.css', array(), filemtime( $base . '/assets/admin/customizer-social-links.css' ) );
	}

	public function render_content() {
		?>
		<span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
		<p><?php esc_html_e( 'Use Move up and Move down to reorder links.', 'custom-theme' ); ?></p>
		<div class="ct-social-links-items"></div>
		<button type="button" class="button ct-social-add"><?php esc_html_e( 'Add link', 'custom-theme' ); ?></button>
		<p class="screen-reader-text ct-social-status" aria-live="polite"></p>
		<template class="ct-social-template">
			<fieldset class="ct-social-row">
				<legend class="ct-social-heading"></legend>
				<label><?php esc_html_e( 'Title', 'custom-theme' ); ?><input type="text" data-field="title"></label>
				<label><?php esc_html_e( 'URL', 'custom-theme' ); ?><input type="url" data-field="url"></label>
				<span class="ct-social-icon-label"><?php esc_html_e( 'Icon', 'custom-theme' ); ?></span>
				<img class="ct-social-icon" alt="" hidden>
				<div class="ct-social-actions">
					<button type="button" class="button ct-social-select"><?php esc_html_e( 'Select image', 'custom-theme' ); ?></button>
					<button type="button" class="button ct-social-clear"><?php esc_html_e( 'Remove icon', 'custom-theme' ); ?></button>
				</div>
				<div class="ct-social-actions">
					<button type="button" class="button ct-social-up"><?php esc_html_e( 'Move up', 'custom-theme' ); ?></button>
					<button type="button" class="button ct-social-down"><?php esc_html_e( 'Move down', 'custom-theme' ); ?></button>
					<button type="button" class="button ct-social-remove"><?php esc_html_e( 'Remove link', 'custom-theme' ); ?></button>
				</div>
			</fieldset>
		</template>
		<?php
	}

	public function to_json() {
		parent::to_json();
		$this->json['labels'] = array(
			'link' => __( 'Link %d', 'custom-theme' ),
			'select' => __( 'Select image', 'custom-theme' ),
			'use' => __( 'Use image', 'custom-theme' ),
			'updated' => __( 'Social links updated.', 'custom-theme' ),
		);
		$this->json['icons'] = array();
		foreach ( ct_sanitize_social_links( $this->value() ) as $row ) {
			if ( $row['icon'] ) {
				$this->json['icons'][ $row['icon'] ] = wp_get_attachment_image_url( $row['icon'], 'thumbnail' );
			}
		}
	}
}
