<?php
/**
 * Homepage section composition.
 *
 * @package CustomTheme
 */

get_header();
?>
<main id="main">123
	<?php
	get_template_part( 'template-parts/sections/hero' );
	get_template_part( 'template-parts/sections/benefits' );
	get_template_part( 'template-parts/sections/about' );
	get_template_part( 'template-parts/sections/contact-form' );
	get_template_part( 'template-parts/sections/contacts' );
	get_template_part( 'template-parts/sections/faq' );
	?>
	<?php if ( is_page() ) : ?>
		<?php while ( have_posts() ) : ?>
			<?php the_post(); ?>
			<div class="entry-content container">
				<?php the_content(); ?>
				<?php wp_link_pages(); ?>
			</div>
		<?php endwhile; ?>
	<?php endif; ?>
</main>
<?php
get_template_part( 'template-parts/sections/popup' );
get_footer();
