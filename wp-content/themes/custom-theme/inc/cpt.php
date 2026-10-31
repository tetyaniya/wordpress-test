<?php
/**
 * Register Custom Post Types and Taxonomies.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

/** Register the two currently specified content types. */
function ct_register_post_types(): void {
	register_post_type(
		'faq',
		array(
			'labels'             => array(
				'name'          => __( 'FAQs', 'custom-theme' ),
				'singular_name' => __( 'FAQ', 'custom-theme' ),
				'add_new_item'  => __( 'Add question', 'custom-theme' ),
				'edit_item'     => __( 'Edit question', 'custom-theme' ),
			),
			'public'             => false,
			'show_ui'            => true,
			'show_in_rest'       => false,
			'publicly_queryable' => false,
			'rewrite'            => false,
			'query_var'          => false,
			'menu_icon'          => 'dashicons-editor-help',
			'supports'           => array( 'title', 'editor', 'page-attributes' ),
		)
	);
}
add_action( 'init', 'ct_register_post_types' );

/** Use the classic editor for FAQ answers. */
// function ct_faq_use_block_editor( bool $use_block_editor, string $post_type ): bool {
// 	return 'faq' === $post_type ? false : $use_block_editor;
// }
// add_filter( 'use_block_editor_for_post_type', 'ct_faq_use_block_editor', 10, 2 );
