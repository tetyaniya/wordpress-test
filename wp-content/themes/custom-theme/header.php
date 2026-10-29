<?php
/**
 * Site header.
 *
 * @package CustomTheme
 */
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>
<a class="skip-link screen-reader-text" href="#main"><?php esc_html_e( 'Skip to content', 'custom-theme' ); ?></a>
<header class="site-header">
	<div class="container">
		<?php if ( has_custom_logo() ) : ?>
			<?php the_custom_logo(); ?>
		<?php else : ?>
			<a href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php bloginfo( 'name' ); ?></a>
		<?php endif; ?>
		<?php
		wp_nav_menu(
			array(
				'theme_location'      => 'primary',
				'container'           => 'nav',
				'container_aria_label' => __( 'Primary navigation', 'custom-theme' ),
				'fallback_cb'         => false,
			)
		);
		?>
	</div>
</header>
