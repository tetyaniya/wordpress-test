<?php
/**
 * Not found template. WordPress sets the HTTP 404 status before rendering.
 *
 * @package CustomTheme
 */

get_header();
?>
<div class="section">
	<h1><?php esc_html_e( 'Page not found', 'custom-theme' ); ?></h1>
	<p><?php esc_html_e( 'The page could not be found. Try searching or return to the homepage.', 'custom-theme' ); ?></p>
	<?php get_search_form(); ?>
	<p><a class="btn-base" href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php esc_html_e( 'Back to homepage', 'custom-theme' ); ?></a></p>
</div>
<?php get_footer(); ?>
