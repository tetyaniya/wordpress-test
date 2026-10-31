<?php
/**
 * About section, rendered by [theme_about].
 *
 * @package CustomTheme
 */
defined( 'ABSPATH' ) || exit;

$about = $args['about'] ?? array();
if ( empty( $about ) ) {
	return;
}
$has_slider  = count( $about['gallery'] ) > 1;
$has_button  = '' !== $about['button_text'] && '' !== $about['button_url'];
$has_content = '' !== $about['title'] || '' !== $about['description'] || $has_button;
$title_id    = wp_unique_id( 'about-title-' );
?>
<section id="about" class="section about-section"<?php if ( '' !== $about['title'] ) : ?> aria-labelledby="<?php echo esc_attr( $title_id ); ?>"<?php endif; ?>>
	<div class="container about-section__inner<?php echo $has_content && ! empty( $about['gallery'] ) ? ' about-section__inner--columns' : ''; ?>">
		<?php if ( $has_content ) : ?>
			<div class="about-section__content">
				<?php if ( '' !== $about['title'] ) : ?>
					<h2 id="<?php echo esc_attr( $title_id ); ?>"><?php echo esc_html( $about['title'] ); ?></h2>
				<?php endif; ?>
				<?php if ( '' !== $about['description'] ) : ?>
					<p class="about-section__description"><?php echo nl2br( esc_html( $about['description'] ) ); ?></p>
				<?php endif; ?>
				<?php if ( $has_button ) : ?>
					<a class="btn" href="<?php echo esc_url( $about['button_url'] ); ?>"><?php echo esc_html( $about['button_text'] ); ?></a>
				<?php endif; ?>
			</div>
		<?php endif; ?>
		<?php if ( ! empty( $about['gallery'] ) ) : ?>
			<div class="about-section__gallery<?php echo $has_slider ? ' swiper' : ''; ?>"<?php if ( $has_slider ) : ?> data-about-slider role="region" aria-label="<?php esc_attr_e( 'About image gallery', 'custom-theme' ); ?>" tabindex="0" data-pagination-label="<?php esc_attr_e( 'Go to image {{index}}', 'custom-theme' ); ?>" data-slide-label="<?php esc_attr_e( 'Image {{index}} of {{slidesLength}}', 'custom-theme' ); ?>"<?php endif; ?>>
				<div class="<?php echo $has_slider ? 'swiper-wrapper' : 'about-section__single'; ?>">
					<?php foreach ( $about['gallery'] as $image_id ) : ?>
						<div class="about-section__slide<?php echo $has_slider ? ' swiper-slide' : ''; ?>">
							<?php echo wp_get_attachment_image( $image_id, 'large', false, array( 'class' => 'about-section__image', 'sizes' => '(min-width: 1024px) 50vw, 100vw' ) ); ?>
						</div>
					<?php endforeach; ?>
				</div>
				<?php if ( $has_slider ) : ?>
					<div class="about-section__controls">
						<button class="about-section__previous" type="button" aria-label="<?php esc_attr_e( 'Previous image', 'custom-theme' ); ?>"><span aria-hidden="true"></span></button>
						<div class="about-section__pagination"></div>
						<button class="about-section__autoplay" type="button" aria-label="<?php esc_attr_e( 'Pause slideshow', 'custom-theme' ); ?>" data-play-label="<?php esc_attr_e( 'Play slideshow', 'custom-theme' ); ?>" data-pause-label="<?php esc_attr_e( 'Pause slideshow', 'custom-theme' ); ?>"><span aria-hidden="true">Ⅱ</span></button>
						<button class="about-section__next" type="button" aria-label="<?php esc_attr_e( 'Next image', 'custom-theme' ); ?>"><span aria-hidden="true"></span></button>
					</div>
				<?php endif; ?>
			</div>
		<?php endif; ?>
	</div>
</section>
