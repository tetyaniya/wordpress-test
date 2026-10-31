<?php
/**
 * Administrator-only uploads of a restricted, static SVG subset.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

/** Rebuild the document from inert vector shapes; never copy arbitrary XML. */
function ct_sanitize_svg( string $source ) {
	$error = new WP_Error( 'ct_invalid_svg', __( 'Upload a valid static SVG without DTD or external resources.', 'custom-theme' ) );
	if ( ! class_exists( 'DOMDocument' ) || '' === trim( $source ) || strlen( $source ) > MB_IN_BYTES || preg_match( '/<!DOCTYPE|<!ENTITY/i', $source ) ) {
		return $error;
	}
	$previous = libxml_use_internal_errors( true );
	$input = new DOMDocument();
	$input->preserveWhiteSpace = false;
	try {
		$loaded = $input->loadXML( $source, LIBXML_NONET );
	} finally {
		libxml_clear_errors();
		libxml_use_internal_errors( $previous );
	}
	$root = $input->documentElement;
	$namespace = 'http://www.w3.org/2000/svg';
	if ( ! $loaded || $input->doctype || ! $root || 'svg' !== $root->localName || ! in_array( $root->namespaceURI, array( null, '', $namespace ), true ) ) {
		return $error;
	}
	$output = new DOMDocument( '1.0', 'UTF-8' );
	$elements = array( 'svg', 'g', 'path', 'rect', 'circle', 'ellipse', 'line', 'polyline', 'polygon', 'defs', 'linearGradient', 'radialGradient', 'stop', 'clipPath', 'mask', 'title', 'desc' );
	$attributes = array( 'id', 'viewBox', 'width', 'height', 'x', 'y', 'x1', 'x2', 'y1', 'y2', 'cx', 'cy', 'r', 'rx', 'ry', 'd', 'points', 'transform', 'preserveAspectRatio', 'fill', 'fill-rule', 'fill-opacity', 'stroke', 'stroke-width', 'stroke-linecap', 'stroke-linejoin', 'stroke-miterlimit', 'stroke-dasharray', 'stroke-dashoffset', 'stroke-opacity', 'opacity', 'clip-path', 'clip-rule', 'clipPathUnits', 'mask', 'maskUnits', 'maskContentUnits', 'gradientUnits', 'gradientTransform', 'spreadMethod', 'offset', 'stop-color', 'stop-opacity', 'fx', 'fy', 'fr', 'vector-effect' );
	$count = 0;
	$copy = function ( DOMElement $node, int $depth ) use ( &$copy, &$count, $output, $namespace, $elements, $attributes ) {
		if ( ++$count > 5000 || $depth > 64 ) {
			throw new RuntimeException( 'SVG complexity limit.' );
		}
		if ( ! in_array( $node->namespaceURI, array( null, '', $namespace ), true ) || ! in_array( $node->tagName, $elements, true ) ) {
			return null;
		}
		$clean = $output->createElementNS( $namespace, $node->tagName );
		foreach ( $node->attributes as $attribute ) {
			$name = $attribute->nodeName;
			$value = trim( $attribute->nodeValue );
			if ( $attribute->namespaceURI || ! in_array( $name, $attributes, true ) ) {
				continue;
			}
			// Paint accepts colors or local fragment references, never CSS or network URLs.
			if ( in_array( $name, array( 'fill', 'stroke', 'stop-color' ), true ) && ! preg_match( '/\A(?:[a-zA-Z]+|\#[0-9a-fA-F]{3,8}|(?:rgb|rgba|hsl|hsla)\([0-9.,%+\s-]+\)|url\(\#[a-zA-Z_][a-zA-Z0-9_.-]*\))\z/', $value ) ) {
				continue;
			}
			if ( in_array( $name, array( 'clip-path', 'mask' ), true ) && ! preg_match( '/\A(?:none|url\(\#[a-zA-Z_][a-zA-Z0-9_.-]*\))\z/', $value ) ) {
				continue;
			}
			if ( 'id' === $name && ! preg_match( '/\A[a-zA-Z_][a-zA-Z0-9_.-]*\z/', $value ) ) {
				continue;
			}
			$clean->setAttribute( $name, $value );
		}
		if ( in_array( $node->tagName, array( 'title', 'desc' ), true ) ) {
			$clean->appendChild( $output->createTextNode( $node->textContent ) );
			return $clean;
		}
		foreach ( $node->childNodes as $child ) {
			if ( $child instanceof DOMElement ) {
				$element = $copy( $child, $depth + 1 );
				if ( $element ) {
					$clean->appendChild( $element );
				}
			}
		}
		return $clean;
	};
	try {
		$output->appendChild( $copy( $root, 0 ) );
	} catch ( RuntimeException $exception ) {
		return $error;
	}
	return $output->saveXML( $output->documentElement );
}

/** Advertise SVG only to administrators who can upload files. */
function ct_svg_upload_mimes( array $mimes ): array {
	unset( $mimes['svg'], $mimes['svgz'] );
	if ( current_user_can( 'manage_options' ) && current_user_can( 'upload_files' ) && class_exists( 'DOMDocument' ) ) {
		$mimes['svg'] = 'image/svg+xml';
	}
	return $mimes;
}
add_filter( 'upload_mimes', 'ct_svg_upload_mimes' );

/** Sanitize the temporary file before either uploads or sideloads move it. */
function ct_svg_upload_prefilter( array $file ): array {
	if ( ! empty( $file['error'] ) || 'svg' !== strtolower( pathinfo( $file['name'], PATHINFO_EXTENSION ) ) ) {
		return $file;
	}
	if ( ! current_user_can( 'manage_options' ) || ! current_user_can( 'upload_files' ) ) {
		$file['error'] = __( 'Only administrators can upload SVG images.', 'custom-theme' );
		return $file;
	}
	$size = is_readable( $file['tmp_name'] ) ? filesize( $file['tmp_name'] ) : false;
	$source = false !== $size && $size > 0 && $size <= MB_IN_BYTES ? file_get_contents( $file['tmp_name'] ) : false;
	$clean = false !== $source ? ct_sanitize_svg( $source ) : new WP_Error( 'ct_svg_size', __( 'SVG images must be readable and no larger than 1 MB.', 'custom-theme' ) );
	if ( is_wp_error( $clean ) ) {
		$file['error'] = $clean->get_error_message();
		return $file;
	}
	if ( strlen( $clean ) !== file_put_contents( $file['tmp_name'], $clean, LOCK_EX ) ) {
		$file['error'] = __( 'The SVG image could not be sanitized.', 'custom-theme' );
		return $file;
	}
	$file['size'] = strlen( $clean );
	$file['type'] = 'image/svg+xml';
	return $file;
}
add_filter( 'wp_handle_upload_prefilter', 'ct_svg_upload_prefilter' );
add_filter( 'wp_handle_sideload_prefilter', 'ct_svg_upload_prefilter' );

/** Correct MIME detection only for already sanitized files and allowed uploads. */
function ct_svg_filetype( array $data, string $file, string $filename, $mimes ): array {
	if ( 'svg' !== strtolower( pathinfo( $filename, PATHINFO_EXTENSION ) ) ) {
		return $data;
	}
	$data = array( 'ext' => false, 'type' => false, 'proper_filename' => false );
	$allowed = wp_check_filetype( $filename, $mimes );
	if ( ! current_user_can( 'manage_options' ) || ! current_user_can( 'upload_files' ) || 'image/svg+xml' !== $allowed['type'] || ! is_readable( $file ) || filesize( $file ) > MB_IN_BYTES ) {
		return $data;
	}
	$source = file_get_contents( $file );
	$clean = false !== $source ? ct_sanitize_svg( $source ) : false;
	if ( is_string( $clean ) && $source === $clean ) {
		$data['ext'] = 'svg';
		$data['type'] = 'image/svg+xml';
	}
	return $data;
}
add_filter( 'wp_check_filetype_and_ext', 'ct_svg_filetype', 10, 4 );

/** Supply dimensions so Media Library and image controls can preview SVGs. */
function ct_svg_metadata( $metadata, int $attachment_id ) {
	if ( 'image/svg+xml' !== get_post_mime_type( $attachment_id ) ) {
		return $metadata;
	}
	$metadata = is_array( $metadata ) ? $metadata : array();
	$file = get_attached_file( $attachment_id );
	if ( ! is_readable( $file ) || filesize( $file ) > MB_IN_BYTES ) {
		return $metadata;
	}
	$source = file_get_contents( $file );
	$clean = false !== $source ? ct_sanitize_svg( $source ) : false;
	if ( ! is_string( $clean ) ) {
		return $metadata;
	}
	$document = new DOMDocument();
	$document->loadXML( $clean, LIBXML_NONET );
	$svg = $document->documentElement;
	$box = preg_split( '/[\s,]+/', trim( $svg->getAttribute( 'viewBox' ) ) );
	$dimensions = array();
	foreach ( array( 'width', 'height' ) as $index => $attribute ) {
		$value = $svg->getAttribute( $attribute );
		$dimension = preg_match( '/\A[0-9]+(?:\.[0-9]+)?(?:px)?\z/', $value ) ? (float) $value : 0;
		if ( $dimension <= 0 && 4 === count( $box ) && is_numeric( $box[ $index + 2 ] ) ) {
			$dimension = (float) $box[ $index + 2 ];
		}
		$dimensions[ $attribute ] = (int) min( 100000, max( 1, round( $dimension ) ) );
	}
	return array_merge( $metadata, $dimensions, array( 'file' => _wp_relative_upload_path( $file ), 'sizes' => array() ) );
}
add_filter( 'wp_generate_attachment_metadata', 'ct_svg_metadata', 10, 2 );
