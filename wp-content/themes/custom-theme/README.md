# Custom Theme

Легка класична WordPress-тема. Вимоги: WordPress 6.5+, PHP 8.1+, Node.js 20.19+ або 22.12+ (рекомендовано Node 22), npm.

## Встановлення та збірка

Запускайте команди на хості / у WSL, **з папки цієї теми**, а не всередині DDEV:

```bash
cd /home/tetiana/projects/wordpress-test/wp-content/themes/custom-theme
npm ci
npm run build
```

`npm ci` використовує зафіксовані версії з lockfile. `npm run build` перевіряє TypeScript
та створює `dist/manifest.json` і CSS/JS з хешами. Папку `dist/` слід додавати до Git
і переносити разом із темою на сервер. Node.js на production не потрібен.

Основний `style.css` містить метадані теми; оформлення пишемо у `src/scss/`.
Тема не активується автоматично: коли потрібно, оберіть **Вигляд → Теми → Custom Theme**.
Налаштування головної сторінки та базу даних цей каркас не змінює.

Щоб редагувати вміст головної через Gutenberg, створіть/оберіть сторінку та
призначте її статичною головною у **Налаштування → Читання**. `front-page.php`
виводить її `the_content()` один раз після PHP-секцій, в окремій `.entry-content`.
PHP-секції редагуються у файлах теми й не дублюються автоматично в Gutenberg.
За режиму «останні записи» область редактора не виводиться, щоб не показувати
на головній вміст випадкового допису.

## Розробка

```bash
npm run dev
```

За замовчуванням Vite слухає `https://localhost:5173`, WordPress відкривайте за адресою
`https://wordpress-test.ddev.site`. Для локального самопідписаного сертифіката один раз
відкрийте `https://localhost:5173/@vite/client` у тому самому браузері й дозвольте
локальний сертифікат. Це потрібно і для HTTPS/WebSocket; за корпоративних обмежень
використайте довірений сертифікат через змінні нижче.

За потреби скопіюйте `.env.example` у `.env` та налаштуйте:

- `WP_ORIGIN` — точний origin WordPress зі схемою й портом, без кінцевого `/` (CORS).
- `VITE_DEV_ORIGIN` — доступна браузеру адреса Vite зі схемою й портом.
- `VITE_HTTPS_KEY` / `VITE_HTTPS_CERT` — шляхи до довіреного ключа й сертифіката;
  обидва параметри необов'язкові, але задаються разом.

Перезапустіть Vite після зміни `.env`. Якщо WordPress використовує HTTP, можна
задати `VITE_DEV_ORIGIN=http://localhost:5173`. Запуск npm всередині контейнера
потребуватиме окремого пробросу порту; поточні налаштування DDEV не змінювалися.

Vite створює `.vite-dev.json` **лише після відкриття порту**, оновлює кожні 10 секунд
і видаляє при штатній зупинці. WordPress використовує його лише в середовищах
`local`/`development` або в DDEV (`IS_DDEV_PROJECT=true`). На інших локальних
оточеннях задайте `WP_ENVIRONMENT_TYPE=local` у власній конфігурації WordPress.
Після аварійної зупинки маркер протерміновується за 30 секунд. На production він
ігнорується. Перед розгортанням завжди виконуйте `npm run build`.

SCSS та TypeScript оновлюються через Vite HMR, зміни PHP перезавантажують сторінку.
PHP підключає `@vite/client` і TS entry як ES-модулі. У production використовує
manifest і підключає CSS entry та його статичних залежностей; відсутність збірки
не зупиняє сайт, адміністратор бачить повідомлення. jQuery не потрібний.

## Структура та розширення

```text
custom-theme/
├── style.css, functions.php, header.php, footer.php
├── front-page.php, index.php, page.php, single.php, single-project.php, 404.php
├── inc/
│   ├── setup.php             # підтримка можливостей WP, меню
│   ├── cpt.php               # faq, project
│   └── enqueue.php           # dev-server / production manifest
├── template-parts/
│   ├── content-none.php
│   ├── content-singular.php  # спільний контент сторінки, запису та проєкту
│   └── sections/             # hero, benefits, about, contact-form,
│                             # contacts, faq, popup
├── src/
│   ├── scss/
│   │   ├── main.scss         # @use для всіх частин
│   │   ├── base/             # normalize, variables, media, global, typography
│   │   ├── components/       # accessibility, forms
│   │   ├── layout/           # header, footer
│   │   └── sections/         # окремий partial для кожної секції
│   └── ts/
│       ├── main.ts           # точка входу JS і SCSS
│       └── modules/          # майбутні модулі поведінки
├── dist/                     # manifest + зібрані assets
├── languages/                # майбутні переклади
├── vite.config.js, tsconfig.json
├── package.json, package-lock.json
├── .env.example, .gitignore, .nvmrc
└── README.md
```

- PHP-налаштування додавайте до `inc/`, нові модулі явно підключайте у `functions.php`.
  Усі власні функції мають префікс `ct_`, переклади — text domain `custom-theme`.
- Розмітку секцій додавайте у `template-parts/sections/`; порядок задає `front-page.php`.
  Це поки семантичні заглушки зі стабільними ID, без клієнтського контенту й дизайну.
  Popup — закритий `<dialog>`; логіку відкриття й закриття додамо пізніше.
- SCSS пишіть у відповідному partial, нові partial підключайте через `@use` у `main.scss`.
  Зображення/шрифти можна додавати в `src/` та імпортувати з TS або SCSS, щоб Vite
  обробив шляхи й хеші. Статичні зображення для PHP можна тримати окремо в темі
  та отримувати URL через `get_theme_file_uri()`.
- TypeScript пишіть у `src/ts/modules/`, імпортуйте та викликайте з `main.ts`.
  Окрема перевірка типів: `npm run typecheck`.
- Swiper встановлено, але ще не імпортується у збірку. Для Hero й About додамо
  окремі модулі, імпорт `swiper`, потрібних модулів `swiper/modules` та їхніх CSS.
- Contact Form 7 — окремий безплатний WordPress-плагін. Він не встановлюється
  автоматично; на наступному етапі встановіть/активуйте його, створіть форму
  й додайте її shortcode в `template-parts/sections/contact-form.php`
  з перевіркою `shortcode_exists( 'contact-form-7' )`.
- CPT `faq`: заголовок = питання, редактор = відповідь; `project`: заголовок,
  текст, excerpt, featured image. Обидва мають `menu_order` для сортування,
  підтримують REST/редактор та призначені для запитів секцій головної сторінки.
  Публічні single/архіви й rewrite вимкнено; скидати permalink rules не потрібно.
  У вимогах названо два CPT, тому третій не вигадувався.

Архітектурний референс — Site Slinger: одна TS-точка входу, SCSS-модулі, Vite manifest
та PHP template parts. Клієнтський код, ACF, шрифти й інші бібліотеки не переносилися.
Дизайн, слайдери, FAQ, popup та обробку форми реалізуємо наступними кроками.

## SCSS і брекпойнти

Змінні та палітра зберігаються в `src/scss/base/_variables.scss`. Міксини у
`base/_media.scss` використовують ту саму карту: `phone-s` 375px, `phone` 520px,
`tablet` 768px, `desktop` 1024px, `laptop` 1280px, `widescreen` 1366px,
`widescreen-lg` 1440px. Невідоме ім'я брекпойнта спричиняє зрозумілу помилку Sass.

Базові правила — для мобільних, `media-up` додає стилі від указаного min-width:

```scss
// Приклад для файлу всередині sections/ або layout/.
@use "../base/variables";
@use "../base/media";

.example {
  padding: variables.$gutter;

  @include media.media-up("tablet") {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}
```

За потреби є `media-down("tablet")` (нижче 768px) та
`media-between("tablet", "desktop")` (768px–1023.98px).
У поточних компонентах використовується mobile-first `media-up`.
Кожен SCSS-модуль явно імпортує потрібні змінні/міксини через `@use`.

Типографіка охоплює body, посилання та h1–h6/класи .h1–.h6. Montserrat для заголовків
і Open Sans для основного тексту підключаються з Google Fonts у `inc/enqueue.php`
з `display=swap` у dev та production. Сімейства задано у `base/_variables.scss`;
за недоступності сервісу працюють системні fallback-шрифти. Форми мають базові стилі полів, select,
textarea, станів помилки та класів CF7; кнопки — `.btn`, `.btn-base`, `.btn-outline`,
submit та `.wp-block-button__link`. Нативні checkbox/radio і фокус збережені.
Вихідні файли кнопок лишаються у знайомому `sections/_button.scss`.

`page.php`, `single.php` та `single-project.php` використовують спільний
`template-parts/content-singular.php` із заголовком, featured image та `the_content()`.
`404.php` містить повідомлення, пошук і посилання на головну.
`single-project.php` підготовлено, але CPT `project` залишається непублічним;
сам файл шаблону не відкриває публічні URL проєктів.
