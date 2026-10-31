<?php
/**
 * Site-wide enquiry banner.
 *
 * @package CustomTheme
 */
?>
<aside id="popup" class="popup" aria-labelledby="popup-title" aria-describedby="popup-description" aria-live="polite" hidden>
	<button class="popup__close" type="button" aria-label="<?php esc_attr_e( 'Закрити банер', 'custom-theme' ); ?>">&times;</button>

	<h2 id="popup-title" class="popup__title">
		<?php esc_html_e( 'Обговорімо ваш проєкт', 'custom-theme' ); ?>
	</h2>
	<p id="popup-description">
		<?php esc_html_e( 'Залиште заявку, і ми зв’яжемося з вами, щоб обговорити деталі.', 'custom-theme' ); ?>
	</p>
	<a class="popup__button btn" href="<?php echo esc_url( home_url( '/#contact-form' ) ); ?>">
		<?php esc_html_e( 'Залишити заявку', 'custom-theme' ); ?>
	</a>
</aside>
