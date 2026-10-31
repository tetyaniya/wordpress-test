<?php
/**
 * Contacts section, rendered by [theme_contacts].
 *
 * @package CustomTheme
 */
defined( 'ABSPATH' ) || exit;

$contacts = $args['contacts'] ?? array();

if ( empty( $contacts ) ) {
	return;
}

$has_details = '' !== $contacts['phone'] || '' !== $contacts['email'] || '' !== $contacts['address'] || ! empty( $contacts['social'] );
$title_id    = wp_unique_id( 'contacts-title-' );

?>

<section id="contacts" class="section contacts-section"<?php if ( '' !== $contacts['title'] ) : ?> aria-labelledby="<?php echo esc_attr( $title_id ); ?>"<?php endif; ?>>
	<div class="container">
		<?php if ( '' !== $contacts['title'] ) : ?>
			<h2 id="<?php echo esc_attr( $title_id ); ?>">
				<?php echo esc_html( $contacts['title'] ); ?>
			</h2>
		<?php endif; ?>

		<div class="contacts-section__inner<?php echo $has_details && '' !== $contacts['map'] ? ' contacts-section__inner--columns' : ''; ?>">
			<?php if ( $has_details ) : ?>
				<div class="contacts-section__details">
					<address class="contacts-section__address">

						<?php if ( '' !== $contacts['phone'] ) : ?>
							<div class="contacts-section__item">
								<span class="contacts-section__label">
									<?php esc_html_e( 'Phone', 'custom-theme' ); ?>
								</span>
								<a href="<?php echo esc_url( ct_get_phone_url() ); ?>">
									<?php echo esc_html( $contacts['phone'] ); ?>
								</a>
							</div>
						<?php endif; ?>

						<?php if ( '' !== $contacts['email'] ) : ?>
							<div class="contacts-section__item">
								<span class="contacts-section__label">
									<?php esc_html_e( 'Email', 'custom-theme' ); ?>
								</span>
								<a href="<?php echo esc_url( 'mailto:' . $contacts['email'] ); ?>">
									<?php echo esc_html( $contacts['email'] ); ?>
								</a>
							</div>
						<?php endif; ?>

						<?php if ( '' !== $contacts['address'] ) : ?>
							<div class="contacts-section__item">
								<span class="contacts-section__label">
									<?php esc_html_e( 'Address', 'custom-theme' ); ?>
								</span>
								<a href="<?php echo esc_url( ct_get_address_url() ); ?>" target="_blank" rel="noopener noreferrer">
									<?php echo nl2br( esc_html( $contacts['address'] ) ); ?>
								</a>
							</div>
						<?php endif; ?>
					</address>

					<?php if ( ! empty( $contacts['social'] ) ) : ?>
						<ul class="contacts-section__social" aria-label="<?php esc_attr_e( 'Social links', 'custom-theme' ); ?>">
							<?php foreach ( $contacts['social'] as $link ) : ?>
								<?php $label = '' !== $link['title'] ? $link['title'] : ( wp_parse_url( $link['url'], PHP_URL_HOST ) ?: __( 'Social profile', 'custom-theme' ) ); ?>
								<li>
									<a href="<?php echo esc_url( $link['url'] ); ?>" target="_blank" rel="noopener noreferrer" aria-label="<?php echo esc_attr( $label ); ?>">
										<?php if ( $link['icon'] ) : ?>
											<?php echo wp_get_attachment_image( $link['icon'], 'thumbnail', false, array( 'alt' => '', 'class' => 'contacts-section__social-icon' ) ); ?>
										<?php else : ?>
											<?php echo esc_html( $label ); ?>
										<?php endif; ?>
									</a>
								</li>
							<?php endforeach; ?>
						</ul>
					<?php endif; ?>
				</div>
			<?php endif; ?>

			<?php if ( '' !== $contacts['map'] ) : ?>
				<div class="contacts-section__map">
					<?php echo $contacts['map']; // Already reconstructed with an allowed Google Maps URL by ct_sanitize_contacts(). ?>
				</div>
			<?php endif; ?>
		</div>
	</div>
</section>
