<?php
/**
 * Site header.
 *
 * @package CustomTheme
 */

$ct_phone    = ct_get_phone();
$ct_has_menu = has_nav_menu( 'primary' );
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
		<div class="site-header__brand">
			<?php if ( has_custom_logo() ) : ?>
				<?php the_custom_logo(); ?>
			<?php else : ?>
				<a class="site-header__title" href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php bloginfo( 'name' ); ?></a>
			<?php endif; ?>
		</div>
		<?php if ( $ct_has_menu ) : ?>
			<button class="site-header__toggle" type="button" aria-expanded="false" aria-controls="header-menu-panel" hidden>
				<svg class="ham hamRotate ham4" viewBox="0 0 100 100" width="48" height="48" aria-hidden="true" focusable="false">
					<path class="line top" d="m 70,33 h -40 c 0,0 -8.5,-0.149796 -8.5,8.5 0,8.649796 8.5,8.5 8.5,8.5 h 20 v -20" />
					<path class="line middle" d="m 70,50 h -40" />
					<path class="line bottom" d="m 30,67 h 40 c 0,0 8.5,0.149796 8.5,-8.5 0,-8.649796 -8.5,-8.5 -8.5,-8.5 h -20 v 20" />
				</svg>
				<span class="screen-reader-text"><?php esc_html_e( 'Menu', 'custom-theme' ); ?></span>
			</button>
		<?php endif; ?>
		<?php if ( $ct_has_menu || '' !== $ct_phone ) : ?>
			<div id="header-menu-panel" class="site-header__panel">
				<?php
				wp_nav_menu(
					array(
						'theme_location'      => 'primary',
						'container'           => 'nav',
						'container_class'     => 'site-header__nav',
						'container_aria_label' => __( 'Primary navigation', 'custom-theme' ),
						'menu_class'          => 'site-header__menu',
						'menu_id'             => 'header-navigation',
						'fallback_cb'         => false,
					)
				);
				?>
				<?php if ( '' !== $ct_phone ) : ?>
					<a class="site-header__phone" href="<?php echo esc_url( ct_get_phone_url() ); ?>"><?php echo esc_html( $ct_phone ); ?></a>
				<?php endif; ?>
			</div>
		<?php endif; ?>
	</div>
</header>
<main id="main">
