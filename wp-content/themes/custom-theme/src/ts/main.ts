import 'vite/modulepreload-polyfill';
import '../scss/main.scss';
import initHeaderMenu from './modules/header-menu.js';
import initFaqAccordion from './modules/faq-accordion.js';

initHeaderMenu();
initFaqAccordion();

// Import section/component modules here when implementing their behaviour.
// Swiper is installed; import it only from the two future slider modules.
