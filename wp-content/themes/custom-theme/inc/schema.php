<?php
/**
 * Homepage structured data, integrated with the AIOSEO graph when available.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

/** Describe the demo business using the shared contact settings. */
function ct_business_schema(): array {
	$business = array(
		'@type'       => 'LocalBusiness',
		'@id'         => home_url( '/#organization' ),
		'name'        => get_bloginfo( 'name' ),
		'url'         => home_url( '/' ),
		'description' => 'Space Laboratory is a demonstration space research laboratory inspired by the Universe.',
	);
	foreach ( array( 'telephone' => ct_get_phone(), 'email' => ct_get_email(), 'address' => ct_get_address() ) as $key => $value ) {
		if ( '' !== $value ) {
			$business[ $key ] = $value;
		}
	}
	$social = array_filter( array_column( ct_get_social_links(), 'url' ) );
	if ( $social ) {
		$business['sameAs'] = array_values( array_unique( $social ) );
	}
	return $business;
}

/** Match the published questions and rendered answers in the homepage FAQ. */
function ct_faq_schema_questions(): array {
	$faqs = new WP_Query( array(
		'post_type'      => 'faq',
		'post_status'    => 'publish',
		'has_password'   => false,
		'posts_per_page' => -1,
		'orderby'        => array( 'menu_order' => 'ASC', 'ID' => 'ASC' ),
		'no_found_rows'  => true,
	) );
	$questions = array();
	while ( $faqs->have_posts() ) {
		$faqs->the_post();
		$question = trim( wp_strip_all_tags( get_the_title() ) );
		$answer   = trim( wp_strip_all_tags( apply_filters( 'the_content', get_the_content() ) ) );
		if ( '' !== $question && '' !== $answer ) {
			$questions[] = array(
				'@type'          => 'Question',
				'name'           => $question,
				'acceptedAnswer' => array( '@type' => 'Answer', 'text' => $answer ),
			);
		}
	}
	wp_reset_postdata();
	return $questions;
}

/** Reuse AIOSEO entity IDs and page metadata without duplicating entities. */
function ct_homepage_schema_graph( array $graph ): array {
	if ( ! is_front_page() || is_admin() ) {
		return $graph;
	}
	$business  = ct_business_schema();
	$questions = ct_faq_schema_questions();
	$page_key  = null;
	$owner_key = null;
	foreach ( $graph as $key => $node ) {
		$types = (array) ( $node['@type'] ?? array() );
		if ( in_array( 'BreadcrumbList', $types, true ) ) {
			unset( $graph[ $key ] );
			continue;
		}
		if ( array_intersect( array( 'Organization', 'LocalBusiness' ), $types ) ) {
			if ( null === $owner_key ) {
				$owner_key = $key;
				$business['@id'] = $node['@id'] ?? $business['@id'];
				$graph[ $key ] = array_merge( $node, $business );
			} else {
				// Preserve references to an existing duplicate business entity.
				$old_id = $node['@id'] ?? '';
				if ( $old_id && $old_id !== $business['@id'] ) {
					array_walk_recursive( $graph, static function ( &$value, $property ) use ( $old_id, $business ) {
						if ( '@id' === $property && $old_id === $value ) {
							$value = $business['@id'];
						}
					} );
				}
				unset( $graph[ $key ] );
			}
		}
		if ( array_intersect( array( 'WebPage', 'FAQPage' ), $types ) ) {
			unset( $graph[ $key ]['breadcrumb'] );
			if ( null === $page_key || in_array( 'FAQPage', $types, true ) ) {
				$page_key = $key;
			}
		}
	}
	if ( null === $owner_key ) {
		$graph[] = $business;
	}
	if ( $questions ) {
		if ( null === $page_key ) {
			$graph[] = array( '@type' => 'FAQPage', '@id' => home_url( '/#webpage' ), 'url' => home_url( '/' ), 'mainEntity' => $questions );
		} else {
			$graph[ $page_key ]['@type'] = array_values( array_unique( array_merge( (array) $graph[ $page_key ]['@type'], array( 'FAQPage' ) ) ) );
			$graph[ $page_key ]['mainEntity'] = $questions;
		}
	}
	return array_values( $graph );
}
add_filter( 'aioseo_schema_output', 'ct_homepage_schema_graph', 20 );

/** Keep homepage JSON-LD available when AIOSEO does not output a graph. */
function ct_homepage_schema_output(): void {
	if ( ! is_front_page() || is_admin() || did_filter( 'aioseo_schema_output' ) ) {
		return;
	}
	$schema = array( '@context' => 'https://schema.org', '@graph' => ct_homepage_schema_graph( array() ) );
	$json = wp_json_encode( $schema, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT );
	if ( false !== $json ) {
		echo '<script type="application/ld+json">' . $json . '</script>' . "\n"; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped -- Safely encoded JSON-LD.
	}
}
add_action( 'wp_head', 'ct_homepage_schema_output', 99 );
