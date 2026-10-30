<?php
/**
 * FAQ section.
 *
 * @package CustomTheme
 */
$ct_faqs = new WP_Query(
	array(
		'post_type'      => 'faq',
		'post_status'    => 'publish',
		'posts_per_page' => -1,
		'orderby'        => array( 'menu_order' => 'ASC', 'ID' => 'ASC' ),
		'no_found_rows'  => true,
	)
);

if ( ! $ct_faqs->have_posts() ) {
	return;
}
?>
<section id="faqs" class="section faq" aria-labelledby="faq-title">
	<div class="container">
		<h2 id="faq-title">
			<?php esc_html_e( 'FAQs', 'custom-theme' ); ?>
		</h2>
		<div class="faq__list js-faq-accordion">
			<?php while ( $ct_faqs->have_posts() ) : ?>
				<?php $ct_faqs->the_post(); ?>
				<div class="faq__item ac">
					<h3 class="faq__question ac-header">
						<button class="faq__trigger ac-trigger" type="button">
							<?php the_title(); ?>
							<span class="faq__icon" aria-hidden="true">
								<svg viewBox="0 0 24 24" width="24" height="24" fill="none">
									<path d="M12 5v14M5 12h14" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
								</svg>
							</span>
						</button>
					</h3>
					<div class="ac-panel">
						<div class="faq__content ac-text"><?php the_content(); ?></div>
					</div>
				</div>
			<?php endwhile; ?>
		</div>
		<?php wp_reset_postdata(); ?>
	</div>
</section>
