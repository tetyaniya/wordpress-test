<?php
/**
 * Site-wide enquiry banner.
 *
 * @package CustomTheme
 */
?>
<aside id="popup" class="popup" aria-labelledby="popup-title" aria-describedby="popup-description" aria-live="polite" hidden>
	<button class="popup__close" type="button" aria-label="<?php esc_attr_e( 'Close banner', 'custom-theme' ); ?>">&times;</button>

	<h2 id="popup-title" class="popup__title">
		<?php esc_html_e( 'Let’s discuss your project', 'custom-theme' ); ?>
	</h2>
	<p id="popup-description">
		<?php esc_html_e( 'Submit a request, and we’ll get in touch to discuss the details.', 'custom-theme' ); ?>
	</p>
	<a class="popup__button btn" href="<?php echo esc_url( home_url( '/#contact-form' ) ); ?>">
		<?php esc_html_e( 'Submit a request', 'custom-theme' ); ?>
	</a>
</aside>
