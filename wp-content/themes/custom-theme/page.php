<?php
/**
 * Default page template.
 *
 * @package CustomTheme
 */

get_header();
?>
<main id="main" class="container section">
	<?php while ( have_posts() ) : ?>
		<?php the_post(); ?>
		<?php get_template_part( 'template-parts/content', 'singular' ); ?>
	<?php endwhile; ?>
</main>
<?php get_footer(); ?>
