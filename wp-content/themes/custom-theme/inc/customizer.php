<?php
/**
 * Shared contact settings in the WordPress Customizer.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

/** Sanitize a display number while preserving its human-readable formatting. */
function ct_sanitize_phone( $value ): string {
	$phone = sanitize_text_field( $value );
	$phone = preg_replace( '/[^0-9+().\s-]/u', '', $phone );
	$phone = trim( preg_replace( '/\s+/', ' ', $phone ) );
	return preg_match( '/[0-9]/', $phone ) ? $phone : '';
}

/** Add the phone field to the existing Site Identity section. */
function ct_customize_register( WP_Customize_Manager $wp_customize ): void {
	$wp_customize->add_setting(
		'ct_phone',
		array(
			'type'              => 'theme_mod',
			'default'           => '',
			'capability'        => 'edit_theme_options',
			'transport'         => 'refresh',
			'sanitize_callback' => 'ct_sanitize_phone',
		)
	);
	$wp_customize->add_control(
		'ct_phone',
		array(
			'label'   => __( 'Phone', 'custom-theme' ),
			'section' => 'title_tagline',
			'type'    => 'tel',
		)
	);
}
add_action( 'customize_register', 'ct_customize_register' );

/** Get the shared display number for the header, footer or contact section. */
function ct_get_phone(): string {
	return ct_sanitize_phone( get_theme_mod( 'ct_phone', '' ) );
}

/** Get a dialable tel: URL without visual separators. */
function ct_get_phone_url(): string {
	$phone = ct_get_phone();
	if ( '' === $phone ) {
		return '';
	}
	$prefix = str_starts_with( $phone, '+' ) ? '+' : '';
	return 'tel:' . $prefix . preg_replace( '/[^0-9]/', '', $phone );
}
