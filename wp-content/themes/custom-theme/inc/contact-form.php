<?php
/**
 * Additional validation for the masked contact phone field.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

/** Leave required, length and general telephone validation to Contact Form 7. */
function ct_validate_contact_phone( $result, $tag ) {
	if ( 'your-phone' !== $tag->name || ! in_array( 'js-phone-mask', (array) $tag->get_option( 'class' ), true ) || ! $result->is_valid( $tag->name ) ) {
		return $result;
	}

	$value = isset( $_POST['your-phone'] ) && is_string( $_POST['your-phone'] )
	? trim( wp_unslash( $_POST['your-phone'] ) )
	: '';

	if ( '' !== $value && null !== $value && ( ! is_string( $value ) || ! preg_match( '/\A\+380 \([0-9]{2}\) [0-9]{3}-[0-9]{2}-[0-9]{2}\z/', $value ) ) ) {
		$result->invalidate( $tag, __( 'Please enter a complete phone number in the format +380 (00) 000-00-00.', 'custom-theme' ) );
	}

	return $result;
}
add_filter( 'wpcf7_validate_tel', 'ct_validate_contact_phone', 20, 2 );
add_filter( 'wpcf7_validate_tel*', 'ct_validate_contact_phone', 20, 2 );

add_filter( 'wpcf7_flamingo_inbound_message_parameters', function ( $args ) {
	if ( isset( $args['fields']['your-name'], $args['fields']['your-phone'] ) ) {
		$args['from']       = $args['from_name'];
		$args['from_email'] = '';
	}

	return $args;
} );
