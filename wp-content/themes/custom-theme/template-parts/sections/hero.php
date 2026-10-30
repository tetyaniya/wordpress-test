<?php
/**
 * Hero section.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

$hero = $args['hero'] ?? array();
if ( empty( $hero ) ) {
	return;
}
$has_slider = count( $hero['gallery'] ) > 1;
$title_id = wp_unique_id( 'hero-title-' );
?>
<section class="section hero"<?php if ( '' !== $hero['title'] ) : ?> aria-labelledby="<?php echo esc_attr( $title_id ); ?>"<?php endif; ?>>
	<div class="container">
		<?php if ( '' !== $hero['title'] ) : ?>
			<h1 id="<?php echo esc_attr( $title_id ); ?>"><?php echo esc_html( $hero['title'] ); ?></h1>
		<?php endif; ?>
		<?php if ( '' !== $hero['subtitle'] ) : ?>
			<p class="hero__subtitle"><?php echo nl2br( esc_html( $hero['subtitle'] ) ); ?></p>
		<?php endif; ?>
		<?php if ( '' !== $hero['button_text'] && '' !== $hero['button_url'] ) : ?>
			<a class="hero__button" href="<?php echo esc_url( $hero['button_url'] ); ?>"><?php echo esc_html( $hero['button_text'] ); ?></a>
		<?php endif; ?>
		<?php if ( ! empty( $hero['gallery'] ) ) : ?>
			<div class="hero__gallery<?php echo $has_slider ? ' swiper' : ''; ?>"<?php if ( $has_slider ) : ?> data-hero-slider role="region" aria-label="<?php esc_attr_e( 'Hero image gallery', 'custom-theme' ); ?>" data-pagination-label="<?php esc_attr_e( 'Go to image {{index}}', 'custom-theme' ); ?>"<?php endif; ?>>
				<div class="<?php echo $has_slider ? 'swiper-wrapper' : 'hero__single'; ?>">
					<?php foreach ( $hero['gallery'] as $image_id ) : ?>
						<div class="hero__slide<?php echo $has_slider ? ' swiper-slide' : ''; ?>">
							<?php echo wp_get_attachment_image( $image_id, 'large', false, array( 'class' => 'hero__image', 'sizes' => '(max-width: 1328px) calc(100vw - 48px), 1280px' ) ); ?>
						</div>
					<?php endforeach; ?>
				</div>
				<?php if ( $has_slider ) : ?>
					<div class="hero__controls">
						<button type="button" class="hero__previous" aria-label="<?php esc_attr_e( 'Previous image', 'custom-theme' ); ?>"><span aria-hidden="true">&larr;</span></button>
						<div class="hero__pagination"></div>
						<button type="button" class="hero__next" aria-label="<?php esc_attr_e( 'Next image', 'custom-theme' ); ?>"><span aria-hidden="true">&rarr;</span></button>
					</div>
				<?php endif; ?>
			</div>
		<?php endif; ?>
	</div>
</section>
