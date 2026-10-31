import 'vite/modulepreload-polyfill';
import '../scss/main.scss';
import initHeaderMenu from './modules/header-menu.js';
import initHeroSlider from './modules/hero-slider.js';
import initAboutSlider from './modules/about-slider.js';
import initFaqAccordion from './modules/faq-accordion.js';
import initPopup from './modules/popup.js';

initHeaderMenu();
initFaqAccordion();
initHeroSlider();
initAboutSlider();
initPopup();
import('./modules/contact-form.js').then(({ default: initContactForm }) => initContactForm());

// Import section/component modules here when implementing their behaviour.
