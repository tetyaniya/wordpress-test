<?php
/**
 * Shared content for pages, posts and projects.
 *
 * @package CustomTheme
 */
?>
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">
		<h1><?php the_title(); ?></h1>
	</header>
	<?php if ( has_post_thumbnail() ) : ?>
		<div class="entry-thumbnail"><?php the_post_thumbnail( 'large' ); ?></div>
	<?php endif; ?>
	<div class="entry-content">
		<?php the_content(); ?>
		<?php wp_link_pages(); ?>
	</div>
</article>
