<?php
/**
 * Homepage section controls and shortcodes.
 *
 * @package CustomTheme
 */

defined( 'ABSPATH' ) || exit;

/** Identify the configured static front page. */
function ct_is_homepage( int $post_id ): bool {
	return 'page' === get_option( 'show_on_front' ) && $post_id > 0 && $post_id === (int) get_option( 'page_on_front' );
}

/** Define tabs in one place. */
function ct_homepage_section_tabs(): array {
	return array(
		'hero' => array(
			'label'    => __( 'Hero', 'custom-theme' ),
			'render'   => 'ct_render_hero_fields',
			'sanitize' => 'ct_sanitize_hero',
		),
		'about' => array(
			'label'    => __( 'About', 'custom-theme' ),
			'render'   => 'ct_render_about_fields',
			'sanitize' => 'ct_sanitize_about',
		),
		'contacts' => array(
			'label'    => __( 'Contacts', 'custom-theme' ),
			'render'   => 'ct_render_contacts_fields',
			'sanitize' => 'ct_sanitize_contacts',
		),
	);
}

/** Keep a Google Maps embed and let the theme control its presentation. */
function ct_sanitize_contacts( array $data ): array {
	$contacts = array(
		'title' => isset( $data['title'] ) && is_string( $data['title'] ) ? sanitize_text_field( $data['title'] ) : '',
		'map'   => '',
	);
	if ( empty( $data['map'] ) || ! is_string( $data['map'] ) ) {
		return $contacts;
	}
	$html = new WP_HTML_Tag_Processor( $data['map'] );
	if ( ! $html->next_tag( 'iframe' ) ) {
		return $contacts;
	}
	$src = $html->get_attribute( 'src' );
	$url = is_string( $src ) ? wp_parse_url( $src ) : false;
	if ( ! $url || 'https' !== ( $url['scheme'] ?? '' ) || ! in_array( strtolower( $url['host'] ?? '' ), array( 'google.com', 'www.google.com', 'maps.google.com' ), true ) || ! preg_match( '#^/maps/embed(?:/|$)#', $url['path'] ?? '' ) || isset( $url['user'] ) || isset( $url['pass'] ) || isset( $url['port'] ) ) {
		return $contacts;
	}
	$contacts['map'] = sprintf(
		'<iframe src="%s" title="%s" loading="lazy" referrerpolicy="no-referrer-when-downgrade" allowfullscreen></iframe>',
		esc_url( $src ),
		esc_attr__( 'Location on Google Maps', 'custom-theme' )
	);
	return $contacts;
}

/** Render Contacts in the shared Homepage Sections meta box. */
function ct_render_contacts_fields( WP_Post $post ): void {
	$stored   = get_post_meta( $post->ID, '_ct_homepage_contacts', true );
	$contacts = ct_sanitize_contacts( is_array( $stored ) ? $stored : array() );
	?>
	<p><?php esc_html_e( 'Shortcode:', 'custom-theme' ); ?> <code>[theme_contacts]</code> <button type="button" class="button ct-copy-shortcode" data-shortcode="[theme_contacts]"><?php esc_html_e( 'Copy shortcode', 'custom-theme' ); ?></button> <span class="ct-copy-status" role="status"></span></p>
	<p class="description"><?php esc_html_e( 'Phone, email, address and social links are taken from Customizer → Contact Details.', 'custom-theme' ); ?></p>
	<p>
		<label for="ct-contacts-title"><?php esc_html_e( 'Title', 'custom-theme' ); ?></label>
		<input class="widefat" type="text" id="ct-contacts-title" name="ct_homepage_sections[contacts][title]" value="<?php echo esc_attr( $contacts['title'] ); ?>">
	</p>
	<p>
		<label for="ct-contacts-map"><?php esc_html_e( 'Map embed code', 'custom-theme' ); ?></label>
		<textarea class="widefat code" rows="6" id="ct-contacts-map" name="ct_homepage_sections[contacts][map]" aria-describedby="ct-contacts-map-help"><?php echo esc_textarea( $contacts['map'] ); ?></textarea>
	</p>
	<p class="description" id="ct-contacts-map-help"><?php esc_html_e( 'In Google Maps on a computer, choose Share → Embed a map → Copy HTML and paste the full iframe here. A sharing link will not work. Only HTTPS Google Maps embed iframes are saved; their size is controlled by the theme. Leave empty to hide the map.', 'custom-theme' ); ?></p>
	<?php
}

/** Keep valid image attachment IDs in their selected order. */
function ct_hero_gallery_ids( $value ): array {
	if ( ! is_array( $value ) ) {
		return array();
	}
	$ids = array();
	foreach ( $value as $value_id ) {
		$id = is_scalar( $value_id ) ? absint( $value_id ) : 0;
		if ( $id && wp_attachment_is_image( $id ) && ! in_array( $id, $ids, true ) ) {
			$ids[] = $id;
		}
	}
	return $ids;
}

/** Normalize Hero fields before storage and use. */
function ct_sanitize_hero( array $data ): array {
	$hero = array();
	foreach ( array( 'title', 'subtitle', 'button_text', 'button_url' ) as $key ) {
		$value = isset( $data[ $key ] ) && is_string( $data[ $key ] ) ? $data[ $key ] : '';
		if ( 'button_url' === $key ) {
			$hero[ $key ] = esc_url_raw( $value );
		} elseif ( 'subtitle' === $key ) {
			$hero[ $key ] = sanitize_textarea_field( $value );
		} else {
			$hero[ $key ] = sanitize_text_field( $value );
		}
	}
	$hero['gallery'] = ct_hero_gallery_ids( $data['gallery'] ?? array() );
	return $hero;
}

/** Normalize About fields using the existing section sanitizers. */
function ct_sanitize_about( array $data ): array {
	$fields = ct_sanitize_hero( $data );
	unset( $fields['subtitle'] );
	$fields['description'] = isset( $data['description'] ) && is_string( $data['description'] ) ? sanitize_textarea_field( $data['description'] ) : '';
	return $fields;
}

/** Render About in the shared Homepage Sections meta box. */
function ct_render_about_fields( WP_Post $post ): void {
	$stored = get_post_meta( $post->ID, '_ct_homepage_about', true );
	$about  = ct_sanitize_about( is_array( $stored ) ? $stored : array() );
	$fields = array(
		'title'       => __( 'Title', 'custom-theme' ),
		'description' => __( 'Description', 'custom-theme' ),
		'button_text' => __( 'Button Text', 'custom-theme' ),
		'button_url'  => __( 'Button URL', 'custom-theme' ),
	);
	?>
	<p><?php esc_html_e( 'Shortcode:', 'custom-theme' ); ?> <code>[theme_about]</code> <button type="button" class="button ct-copy-shortcode" data-shortcode="[theme_about]"><?php esc_html_e( 'Copy shortcode', 'custom-theme' ); ?></button> <span class="ct-copy-status" role="status"></span></p>
	<?php foreach ( $fields as $key => $label ) : ?>
		<p>
			<label for="ct-about-<?php echo esc_attr( $key ); ?>"><?php echo esc_html( $label ); ?></label>
			<?php if ( 'description' === $key ) : ?>
				<textarea class="widefat" rows="5" id="ct-about-description" name="ct_homepage_sections[about][description]"><?php echo esc_textarea( $about[ $key ] ); ?></textarea>
			<?php else : ?>
				<input class="widefat" type="<?php echo 'button_url' === $key ? 'url' : 'text'; ?>" id="ct-about-<?php echo esc_attr( $key ); ?>" name="ct_homepage_sections[about][<?php echo esc_attr( $key ); ?>]" value="<?php echo esc_attr( $about[ $key ] ); ?>">
			<?php endif; ?>
		</p>
	<?php endforeach; ?>
	<div class="ct-about-gallery" data-gallery-name="ct_homepage_sections[about][gallery][]" data-gallery-title="<?php esc_attr_e( 'Select About images', 'custom-theme' ); ?>">
		<p><strong><?php esc_html_e( 'Gallery', 'custom-theme' ); ?></strong></p>
		<p class="description" id="ct-about-gallery-help"><?php esc_html_e( 'Choose images. Drag thumbnails or use the arrow buttons to reorder.', 'custom-theme' ); ?></p>
		<ul class="ct-gallery-items" aria-label="<?php esc_attr_e( 'About images', 'custom-theme' ); ?>" aria-describedby="ct-about-gallery-help">
			<?php foreach ( $about['gallery'] as $id ) : ?>
				<li class="ct-gallery-item" data-id="<?php echo esc_attr( $id ); ?>">
					<?php echo wp_get_attachment_image( $id, 'thumbnail' ); ?>
					<input type="hidden" name="ct_homepage_sections[about][gallery][]" value="<?php echo esc_attr( $id ); ?>">
					<div class="ct-gallery-actions">
						<button type="button" class="button ct-image-up" aria-label="<?php esc_attr_e( 'Move image earlier', 'custom-theme' ); ?>">&larr;</button>
						<button type="button" class="button ct-image-down" aria-label="<?php esc_attr_e( 'Move image later', 'custom-theme' ); ?>">&rarr;</button>
						<button type="button" class="button ct-image-remove"><?php esc_html_e( 'Remove', 'custom-theme' ); ?></button>
					</div>
				</li>
			<?php endforeach; ?>
		</ul>
		<button type="button" class="button ct-gallery-select"><?php esc_html_e( 'Select images', 'custom-theme' ); ?></button>
		<span class="ct-gallery-status" role="status"></span>
	</div>
	<?php
}

/** Register the single homepage meta box. */
function ct_add_homepage_sections( WP_Post $post ): void {
	if ( ct_is_homepage( $post->ID ) ) {
		add_meta_box( 'ct-homepage-sections', __( 'Homepage Sections', 'custom-theme' ), 'ct_render_homepage_sections', 'page', 'normal', 'high', array( '__block_editor_compatible_meta_box' => true ) );
	}
}
add_action( 'add_meta_boxes_page', 'ct_add_homepage_sections' );

/** Render the shared tab container. */
function ct_render_homepage_sections( WP_Post $post ): void {
	wp_nonce_field( 'ct_save_homepage_sections', 'ct_homepage_sections_nonce' );
	$tabs = ct_homepage_section_tabs();
	?>
	<div class="ct-homepage-sections">
		<div class="nav-tab-wrapper" role="tablist" aria-label="<?php esc_attr_e( 'Homepage sections', 'custom-theme' ); ?>">
			<?php foreach ( $tabs as $key => $tab ) : ?>
				<button type="button" role="tab" class="nav-tab<?php echo array_key_first( $tabs ) === $key ? ' nav-tab-active' : ''; ?>" id="ct-tab-<?php echo esc_attr( $key ); ?>" aria-controls="ct-panel-<?php echo esc_attr( $key ); ?>" aria-selected="<?php echo array_key_first( $tabs ) === $key ? 'true' : 'false'; ?>" tabindex="<?php echo array_key_first( $tabs ) === $key ? '0' : '-1'; ?>"><?php echo esc_html( $tab['label'] ); ?></button>
			<?php endforeach; ?>
		</div>
		<?php foreach ( $tabs as $key => $tab ) : ?>
			<div role="tabpanel" id="ct-panel-<?php echo esc_attr( $key ); ?>" aria-labelledby="ct-tab-<?php echo esc_attr( $key ); ?>" <?php echo array_key_first( $tabs ) !== $key ? 'hidden' : ''; ?>>
				<?php call_user_func( $tab['render'], $post ); ?>
			</div>
		<?php endforeach; ?>
	</div>
	<?php
}

/** Render Hero fields. */
function ct_render_hero_fields( WP_Post $post ): void {
	$stored = get_post_meta( $post->ID, '_ct_homepage_hero', true );
	$hero   = ct_sanitize_hero( is_array( $stored ) ? $stored : array() );
	$fields = array(
		'title'       => __( 'Title', 'custom-theme' ),
		'subtitle'    => __( 'Subtitle', 'custom-theme' ),
		'button_text' => __( 'Button Text', 'custom-theme' ),
		'button_url'  => __( 'Button URL', 'custom-theme' ),
	);
	?>
	<p><?php esc_html_e( 'Shortcode:', 'custom-theme' ); ?> <code>[theme_hero]</code> <button type="button" class="button ct-copy-shortcode" data-shortcode="[theme_hero]"><?php esc_html_e( 'Copy shortcode', 'custom-theme' ); ?></button> <span class="ct-copy-status" role="status"></span></p>
	<?php foreach ( $fields as $key => $label ) : ?>
		<p>
			<label for="ct-hero-<?php echo esc_attr( $key ); ?>"><?php echo esc_html( $label ); ?></label>
			<?php if ( 'subtitle' === $key ) : ?>
				<textarea class="widefat" rows="3" id="ct-hero-subtitle" name="ct_homepage_sections[hero][subtitle]"><?php echo esc_textarea( $hero[ $key ] ); ?></textarea>
			<?php else : ?>
				<input class="widefat" type="<?php echo 'button_url' === $key ? 'url' : 'text'; ?>" id="ct-hero-<?php echo esc_attr( $key ); ?>" name="ct_homepage_sections[hero][<?php echo esc_attr( $key ); ?>]" value="<?php echo esc_attr( $hero[ $key ] ); ?>">
			<?php endif; ?>
		</p>
	<?php endforeach; ?>
	<div class="ct-hero-gallery">
		<p><strong><?php esc_html_e( 'Gallery', 'custom-theme' ); ?></strong></p>
		<p class="description" id="ct-hero-gallery-help"><?php esc_html_e( 'Choose images. Drag thumbnails or use the arrow buttons to reorder.', 'custom-theme' ); ?></p>
		<ul class="ct-gallery-items" aria-label="<?php esc_attr_e( 'Hero images', 'custom-theme' ); ?>" aria-describedby="ct-hero-gallery-help">
			<?php foreach ( $hero['gallery'] as $id ) : ?>
				<li class="ct-gallery-item" data-id="<?php echo esc_attr( $id ); ?>">
					<?php echo wp_get_attachment_image( $id, 'thumbnail' ); ?>
					<input type="hidden" name="ct_homepage_sections[hero][gallery][]" value="<?php echo esc_attr( $id ); ?>">
					<div class="ct-gallery-actions">
						<button type="button" class="button ct-image-up" aria-label="<?php esc_attr_e( 'Move image earlier', 'custom-theme' ); ?>">&larr;</button>
						<button type="button" class="button ct-image-down" aria-label="<?php esc_attr_e( 'Move image later', 'custom-theme' ); ?>">&rarr;</button>
						<button type="button" class="button ct-image-remove"><?php esc_html_e( 'Remove', 'custom-theme' ); ?></button>
					</div>
				</li>
			<?php endforeach; ?>
		</ul>
		<button type="button" class="button ct-gallery-select"><?php esc_html_e( 'Select images', 'custom-theme' ); ?></button>
		<span class="ct-gallery-status" role="status"></span>
	</div>
	<?php
}

/** Save only a deliberate edit of the static homepage. */
function ct_save_homepage_sections( int $post_id ): void {
	if ( ! ct_is_homepage( $post_id ) || ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) || wp_is_post_autosave( $post_id ) || wp_is_post_revision( $post_id ) || ! current_user_can( 'edit_post', $post_id ) ) {
		return;
	}
	if ( ! isset( $_POST['ct_homepage_sections_nonce'] ) || ! is_string( $_POST['ct_homepage_sections_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['ct_homepage_sections_nonce'] ) ), 'ct_save_homepage_sections' ) ) {
		return;
	}
	if ( ! isset( $_POST['ct_homepage_sections'] ) || ! is_array( $_POST['ct_homepage_sections'] ) ) {
		return;
	}
	$data = wp_unslash( $_POST['ct_homepage_sections'] );
	foreach ( ct_homepage_section_tabs() as $key => $tab ) {
		if ( isset( $data[ $key ] ) && is_array( $data[ $key ] ) ) {
			update_post_meta( $post_id, '_ct_homepage_' . $key, wp_slash( call_user_func( $tab['sanitize'], $data[ $key ] ) ) );
		}
	}
}
add_action( 'save_post_page', 'ct_save_homepage_sections' );

/** Load media and controls only on the homepage editor. */
function ct_homepage_admin_assets( string $hook ): void {
	global $post;
	if ( 'post.php' !== $hook || ! $post instanceof WP_Post || ! ct_is_homepage( $post->ID ) ) {
		return;
	}
	wp_enqueue_media( array( 'post' => $post->ID ) );
	$path = get_template_directory() . '/assets/admin/homepage-sections';
	$url  = get_template_directory_uri() . '/assets/admin/homepage-sections';
	wp_enqueue_style( 'ct-homepage-sections', $url . '.css', array(), filemtime( $path . '.css' ) );
	wp_enqueue_script( 'ct-homepage-sections', $url . '.js', array( 'jquery', 'jquery-ui-sortable', 'media-views' ), filemtime( $path . '.js' ), true );
	wp_localize_script(
		'ct-homepage-sections',
		'ctHomepageSections',
		array(
			'select'     => __( 'Select Hero images', 'custom-theme' ),
			'use'        => __( 'Use images', 'custom-theme' ),
			'remove'     => __( 'Remove', 'custom-theme' ),
			'earlier'    => __( 'Move image earlier', 'custom-theme' ),
			'later'      => __( 'Move image later', 'custom-theme' ),
			'copied'     => __( 'Shortcode copied.', 'custom-theme' ),
			/* translators: %s: section shortcode. */
			'copyFailed' => __( 'Copy failed. Please copy %s manually.', 'custom-theme' ),
		)
	);
}
add_action( 'admin_enqueue_scripts', 'ct_homepage_admin_assets' );

/** Return the configured homepage Hero wherever the shortcode is used. */
function ct_hero_shortcode(): string {
	$post_id = (int) get_option( 'page_on_front' );
	if ( ! ct_is_homepage( $post_id ) ) {
		return '';
	}
	$stored = get_post_meta( $post_id, '_ct_homepage_hero', true );
	$hero   = ct_sanitize_hero( is_array( $stored ) ? $stored : array() );
	if ( '' === $hero['title'] && '' === $hero['subtitle'] && empty( $hero['gallery'] ) && ( '' === $hero['button_text'] || '' === $hero['button_url'] ) ) {
		return '';
	}
	ob_start();
	get_template_part( 'template-parts/sections/hero', null, array( 'hero' => $hero ) );
	return (string) ob_get_clean();
}
add_shortcode( 'theme_hero', 'ct_hero_shortcode' );

/** Return About only where its shortcode is inserted. */
function ct_about_shortcode(): string {
	$post_id = (int) get_option( 'page_on_front' );
	if ( ! ct_is_homepage( $post_id ) ) {
		return '';
	}
	$stored = get_post_meta( $post_id, '_ct_homepage_about', true );
	$about  = ct_sanitize_about( is_array( $stored ) ? $stored : array() );
	if ( '' === $about['title'] && '' === $about['description'] && empty( $about['gallery'] ) && ( '' === $about['button_text'] || '' === $about['button_url'] ) ) {
		return '';
	}
	ob_start();
	get_template_part( 'template-parts/sections/about', null, array( 'about' => $about ) );
	return (string) ob_get_clean();
}
add_shortcode( 'theme_about', 'ct_about_shortcode' );

/** Render shared contact details and the homepage map at the shortcode position. */
function ct_contacts_shortcode(): string {
	$post_id = (int) get_option( 'page_on_front' );
	if ( ! ct_is_homepage( $post_id ) ) {
		return '';
	}
	$stored   = get_post_meta( $post_id, '_ct_homepage_contacts', true );
	$contacts = ct_sanitize_contacts( is_array( $stored ) ? $stored : array() );
	$contacts['phone']   = ct_get_phone();
	$contacts['email']   = ct_get_email();
	$contacts['address'] = ct_get_address();
	$contacts['social']  = array_values( array_filter( ct_get_social_links(), static function ( $link ) {
		return '' !== $link['url'] && ( '' !== $link['title'] || $link['icon'] );
	} ) );
	if ( '' === $contacts['title'] && '' === $contacts['map'] && '' === $contacts['phone'] && '' === $contacts['email'] && '' === $contacts['address'] && empty( $contacts['social'] ) ) {
		return '';
	}
	ob_start();
	get_template_part( 'template-parts/sections/contacts', null, array( 'contacts' => $contacts ) );
	return (string) ob_get_clean();
}
add_shortcode( 'theme_contacts', 'ct_contacts_shortcode' );
