<?php
/**
 * Site footer.
 *
 * @package CustomTheme
 */

$footer_phone = ct_get_phone();
$footer_social = array_filter( ct_get_social_links(), static fn( $link ) => '' !== $link['url'] );

?>

</main>

<?php
get_template_part( 'template-parts/sections/popup' );
?>
<footer class="site-footer">
	<div class="container">
		<div class="site-footer__brand">
			<?php if ( has_custom_logo() ) : ?>
				<?php the_custom_logo(); ?>
			<?php else : ?>
				<a class="site-footer__title" href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php bloginfo( 'name' ); ?></a>
			<?php endif; ?>

			<?php if ( $footer_social ) : ?>
				<ul class="site-footer__social" aria-label="<?php esc_attr_e( 'Social links', 'custom-theme' ); ?>">
					<?php foreach ( $footer_social as $link ) : ?>
						<?php $label = '' !== $link['title'] ? $link['title'] : ( wp_parse_url( $link['url'], PHP_URL_HOST ) ?: __( 'Social profile', 'custom-theme' ) ); ?>
						<li>
							<a href="<?php echo esc_url( $link['url'] ); ?>" target="_blank" rel="noopener noreferrer" aria-label="<?php echo esc_attr( $label ); ?>">
								<?php if ( $link['icon'] ) : ?>
									<?php echo wp_get_attachment_image( $link['icon'], 'thumbnail', false, array( 'alt' => '' ) ); ?>
								<?php else : ?>
									<?php echo esc_html( $label ); ?>
								<?php endif; ?>
							</a>
						</li>
					<?php endforeach; ?>
				</ul>
			<?php endif; ?>
		</div>

		<?php
		wp_nav_menu(
			array(
				'theme_location'       => 'footer',
				'container'            => 'nav',
				'container_class'      => 'site-footer__nav',
				'container_aria_label' => __( 'Footer navigation', 'custom-theme' ),
				'menu_class'           => 'site-footer__menu',
				'menu_id'              => 'footer-navigation',
				'fallback_cb'          => false,
			)
		);
		?>

		<div class="site-footer__contact">

			<?php if ( '' !== $footer_phone ) : ?>
				<a class="site-footer__phone" href="<?php echo esc_url( ct_get_phone_url() ); ?>">
					<?php echo esc_html( $footer_phone ); ?>
				</a>
			<?php endif; ?>

			<a class="site-footer__button btn" href="<?php echo esc_url( home_url( '/#contact-form' ) ); ?>">
				<?php esc_html_e( 'Submit a request', 'custom-theme' ); ?>
			</a>
		</div>

		<div class="site-footer__bottom">
			<p class="site-footer__copyright">&copy; <?php echo esc_html( wp_date( 'Y' ) ); ?>
				<?php bloginfo( 'name' ); ?>
			</p>
			<?php if ( get_bloginfo( 'description' ) ) : ?>
				<p class="site-footer__description"><?php echo esc_html( get_bloginfo( 'description' ) ); ?></p>
			<?php endif; ?>
		</div>
	</div>
</footer>

<?php wp_footer(); ?>
</body>
</html>
