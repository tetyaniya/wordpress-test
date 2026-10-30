import Swiper from 'swiper';
import { A11y, Navigation, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/a11y';

export default function initAboutSlider() {
  document.querySelectorAll('[data-about-slider]').forEach((gallery) => {
    if (gallery.swiper) return;
    const previous = gallery.querySelector('.about-section__previous');
    const next = gallery.querySelector('.about-section__next');
    const pagination = gallery.querySelector('.about-section__pagination');
    if (!previous || !next || !pagination) return;
    const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');

    const slider = new Swiper(gallery, {
      modules: [Navigation, Pagination, A11y],
      slidesPerView: 1,
      speed: reducedMotion.matches ? 0 : 600,
      navigation: { prevEl: previous, nextEl: next },
      pagination: {
        el: pagination,
        clickable: true,
        bulletElement: 'button',
        renderBullet: (index, className) => {
          const bullet = document.createElement('button');
          bullet.type = 'button';
          bullet.className = className;
          bullet.setAttribute('aria-label', gallery.dataset.paginationLabel.replace('{{index}}', index + 1));
          return bullet.outerHTML;
        },
      },
      a11y: {
        prevSlideMessage: previous.getAttribute('aria-label'),
        nextSlideMessage: next.getAttribute('aria-label'),
        paginationBulletMessage: gallery.dataset.paginationLabel,
        slideLabelMessage: gallery.dataset.slideLabel,
      },
    });

    // Keep arrow keys local to this gallery, including pages with multiple sliders.
    gallery.addEventListener('keydown', (event) => {
      if (event.altKey || event.ctrlKey || event.metaKey || event.shiftKey) return;
      if (event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
        event.preventDefault();
        if (event.key === 'ArrowLeft') slider.slidePrev();
        else slider.slideNext();
      }
    });

    reducedMotion.addEventListener('change', () => {
      slider.params.speed = reducedMotion.matches ? 0 : 600;
    });
  });
}
