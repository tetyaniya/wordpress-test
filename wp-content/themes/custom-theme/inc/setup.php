<?php
/**
 * Theme supports and navigation.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

/** Set up the theme. */
function ct_setup(): void {
	load_theme_textdomain( 'custom-theme', get_template_directory() . '/languages' );
	add_theme_support( 'title-tag' );
	add_theme_support( 'post-thumbnails' );
	add_theme_support( 'automatic-feed-links' );
	add_theme_support( 'custom-logo' );
	add_theme_support( 'responsive-embeds' );
	add_theme_support( 'html5', array( 'search-form', 'comment-form', 'comment-list', 'gallery', 'caption', 'style', 'script' ) );
	register_nav_menus(
		array(
			'primary' => __( 'Primary navigation', 'custom-theme' ),
			'footer'  => __( 'Footer navigation', 'custom-theme' ),
		)
	);
}
add_action( 'after_setup_theme', 'ct_setup' );


// Disable automatic paragraph insertion in Contact Form 7.
add_filter( 'wpcf7_autop_or_not', '__return_false' );