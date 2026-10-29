<?php
/**
 * Vite development assets and production manifest.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

/** Read the short-lived marker only in a local/development environment. */
function ct_vite_dev_url(): string {
	if ( ! in_array( wp_get_environment_type(), array( 'local', 'development' ), true ) && 'true' !== getenv( 'IS_DDEV_PROJECT' ) ) {
		return '';
	}
	$path = get_template_directory() . '/.vite-dev.json';
	if ( ! is_readable( $path ) || time() - filemtime( $path ) > 30 ) {
		return '';
	}
	$data = json_decode( file_get_contents( $path ), true ); // phpcs:ignore WordPress.WP.AlternativeFunctions.file_get_contents_file_get_contents
	$url  = isset( $data['url'] ) ? esc_url_raw( $data['url'], array( 'http', 'https' ) ) : '';
	return untrailingslashit( $url );
}

/** Collect styles from the entry and its static imports, once per chunk. */
function ct_vite_css( array $manifest, string $key, array &$visited ): array {
	if ( isset( $visited[ $key ] ) || ! isset( $manifest[ $key ] ) ) {
		return array();
	}
	$visited[ $key ] = true;
	$chunk           = $manifest[ $key ];
	$styles          = array();
	foreach ( $chunk['imports'] ?? array() as $import ) {
		$styles = array_merge( $styles, ct_vite_css( $manifest, $import, $visited ) );
	}
	return array_merge( $styles, $chunk['css'] ?? array() );
}

/** Enqueue module scripts and all manifest styles without a jQuery dependency. */
function ct_enqueue_assets(): void {
	wp_enqueue_style(
		'ct-google-fonts',
		'https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Open+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400;1,700&display=swap',
		array(),
		null
	);

	$dev_url = ct_vite_dev_url();
	if ( $dev_url ) {
		wp_enqueue_script_module( 'ct-vite-client', $dev_url . '/@vite/client', array(), null );
		wp_enqueue_script_module( 'ct-main', $dev_url . '/src/ts/main.ts', array(), null );
		return;
	}
	$path = get_template_directory() . '/dist/manifest.json';
	if ( ! is_readable( $path ) ) {
		return;
	}
	$manifest = json_decode( file_get_contents( $path ), true ); // phpcs:ignore WordPress.WP.AlternativeFunctions.file_get_contents_file_get_contents
	$entry    = 'src/ts/main.ts';
	if ( ! is_array( $manifest ) || empty( $manifest[ $entry ]['file'] ) ) {
		return;
	}
	$base    = get_template_directory_uri() . '/dist/';
	$visited = array();
	foreach ( array_unique( ct_vite_css( $manifest, $entry, $visited ) ) as $index => $css ) {
		wp_enqueue_style( 'ct-style-' . $index, $base . $css, array(), null );
	}
	wp_enqueue_script_module( 'ct-main', $base . $manifest[ $entry ]['file'], array(), null );
}
add_action( 'wp_enqueue_scripts', 'ct_enqueue_assets' );

/** Explain missing build assets to administrators without interrupting the site. */
function ct_assets_notice(): void {
	if ( ! current_user_can( 'edit_theme_options' ) || ct_vite_dev_url() || is_readable( get_template_directory() . '/dist/manifest.json' ) ) {
		return;
	}
	echo '<div class="notice notice-warning"><p>' . esc_html__( 'Custom Theme: run npm install and npm run build inside the theme directory to generate CSS and JavaScript.', 'custom-theme' ) . '</p></div>';
}
add_action( 'admin_notices', 'ct_assets_notice' );
