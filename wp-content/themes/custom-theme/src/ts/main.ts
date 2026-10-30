import 'vite/modulepreload-polyfill';
import '../scss/main.scss';
import initHeaderMenu from './modules/header-menu.js';
import initHeroSlider from './modules/hero-slider.js';
import initAboutSlider from './modules/about-slider.js';
import initFaqAccordion from './modules/faq-accordion.js';

initHeaderMenu();
initFaqAccordion();
initHeroSlider();
initAboutSlider();

// Import section/component modules here when implementing their behaviour.
