
<?php
/**
 * Front page template.
 *
 * Renders Gutenberg content followed by the FAQ section.
 *
 * @package CustomTheme
 */

get_header();

while ( have_posts() ) :
	the_post();

	the_content();
	wp_link_pages();
endwhile;

get_template_part( 'template-parts/sections/faq' );

get_footer();
