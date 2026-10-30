import 'vite/modulepreload-polyfill';
import '../scss/main.scss';
import initHeaderMenu from './modules/header-menu.js';
import initHeroSlider from './modules/hero-slider.js';
import initFaqAccordion from './modules/faq-accordion.js';

initHeaderMenu();
initFaqAccordion();
initHeroSlider();

// Import section/component modules here when implementing their behaviour.
