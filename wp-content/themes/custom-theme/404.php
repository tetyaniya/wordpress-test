<?php
/**
 * Not found template. WordPress sets the HTTP 404 status before rendering.
 *
 * @package CustomTheme
 */

get_header();
?>
<section class="not-found" aria-labelledby="not-found-title">
	<div class="container">
		<div class="not-found__inner">
			<p class="not-found__code" aria-hidden="true">404</p>
			<h1 id="not-found-title"><?php esc_html_e( 'Houston, we have a problem.', 'custom-theme' ); ?></h1>
			<p class="not-found__description"><?php esc_html_e( 'This page is lost in space.', 'custom-theme' ); ?></p>
			<a class="btn" href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php esc_html_e( 'Back to homepage', 'custom-theme' ); ?></a>
		</div>
	</div>
</section>
<?php get_footer(); ?>
