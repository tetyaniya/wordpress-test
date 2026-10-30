<?php
/**
 * Default page template.
 *
 * @package CustomTheme
 */

get_header();
?>
<div class="section">
	<?php while ( have_posts() ) : ?>
		<?php the_post(); ?>
		<?php get_template_part( 'template-parts/content', 'singular' ); ?>
	<?php endwhile; ?>
</div>
<?php get_footer(); ?>
