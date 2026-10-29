<?php
/**
 * Site footer.
 *
 * @package CustomTheme
 */
?>
<footer class="site-footer">
	<div class="container">
		<p>&copy; <?php echo esc_html( wp_date( 'Y' ) ); ?> <?php bloginfo( 'name' ); ?></p>
		<?php wp_nav_menu( array( 'theme_location' => 'footer', 'container' => 'nav', 'container_aria_label' => __( 'Footer navigation', 'custom-theme' ), 'fallback_cb' => false ) ); ?>
	</div>
</footer>
<?php wp_footer(); ?>
</body>
</html>
