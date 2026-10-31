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

/** Keep only supported social link fields and valid image attachment IDs. */
function ct_sanitize_social_links( $value ): array {
	if ( ! is_array( $value ) ) {
		return array();
	}
	$links = array();
	foreach ( $value as $row ) {
		if ( ! is_array( $row ) ) {
			continue;
		}
		$title = isset( $row['title'] ) && is_string( $row['title'] ) ? sanitize_text_field( $row['title'] ) : '';
		$url   = isset( $row['url'] ) && is_string( $row['url'] ) ? esc_url_raw( $row['url'], array( 'http', 'https' ) ) : '';
		$icon  = isset( $row['icon'] ) && is_scalar( $row['icon'] ) ? absint( $row['icon'] ) : 0;
		$icon  = $icon && wp_attachment_is_image( $icon ) ? $icon : 0;
		$links[] = array( 'title' => $title, 'url' => $url, 'icon' => $icon );
	}
	return $links;
}

/** Register independent, shared contact settings. */
function ct_customize_register( WP_Customize_Manager $wp_customize ): void {
	require_once get_template_directory() . '/inc/class-ct-social-links-control.php';
	$wp_customize->add_section( 'ct_contact_details', array(
		'title' => __( 'Contact Details', 'custom-theme' ),
		'priority' => 35,
	) );
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
			'section' => 'ct_contact_details',
			'type'    => 'tel',
		)
	);
	foreach ( array(
		'ct_email' => array( 'label' => __( 'Email', 'custom-theme' ), 'type' => 'email', 'sanitize' => 'sanitize_email' ),
		'ct_address' => array( 'label' => __( 'Address', 'custom-theme' ), 'type' => 'textarea', 'sanitize' => 'sanitize_textarea_field' ),
	) as $key => $field ) {
		$wp_customize->add_setting( $key, array(
			'type' => 'theme_mod',
			'default' => '',
			'capability' => 'edit_theme_options',
			'sanitize_callback' => $field['sanitize'],
		) );
		$wp_customize->add_control( $key, array(
			'label' => $field['label'],
			'type' => $field['type'],
			'section' => 'ct_contact_details',
		) );
	}
	$wp_customize->add_setting( 'ct_social_links', array(
		'type' => 'theme_mod',
		'default' => array(),
		'capability' => 'edit_theme_options',
		'sanitize_callback' => 'ct_sanitize_social_links',
	) );
	$wp_customize->add_control( new CT_Social_Links_Control( $wp_customize, 'ct_social_links', array(
		'label' => __( 'Social Links', 'custom-theme' ),
		'section' => 'ct_contact_details',
	) ) );
}
add_action( 'customize_register', 'ct_customize_register' );

/** Shared values for Contacts and Footer templates. Escape when rendering. */
function ct_get_email(): string {
	return sanitize_email( get_theme_mod( 'ct_email', '' ) );
}

function ct_get_address(): string {
	return sanitize_textarea_field( get_theme_mod( 'ct_address', '' ) );
}

/** Open a Google Maps search for the shared address. */
function ct_get_address_url(): string {
	$address = ct_get_address();
	return '' !== $address ? 'https://www.google.com/maps/search/?api=1&query=' . rawurlencode( preg_replace( '/\s+/u', ' ', $address ) ) : '';
}

function ct_get_social_links(): array {
	return ct_sanitize_social_links( get_theme_mod( 'ct_social_links', array() ) );
}

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
