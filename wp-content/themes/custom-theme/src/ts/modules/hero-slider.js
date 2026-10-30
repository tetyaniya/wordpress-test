import Swiper from 'swiper';
import { A11y, Autoplay, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/a11y';

export default function initHeroSlider() {
  document.querySelectorAll('[data-hero-slider]').forEach((gallery) => {
    const pagination = gallery.querySelector('.hero__pagination');
    const toggle = gallery.querySelector('.hero__autoplay');
    const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
    if (!pagination || !toggle) return;
    let paused = reducedMotion.matches;

    const slider = new Swiper(gallery, {
      modules: [Pagination, A11y, Autoplay],
      slidesPerView: 1,
      loop: true,
      speed: reducedMotion.matches ? 0 : 600,
      autoplay: {
        enabled: !paused,
        delay: 5000,
        disableOnInteraction: false,
        pauseOnMouseEnter: true,
      },
      pagination: {
        el: pagination,
        clickable: true,
        bulletElement: 'button',
        renderBullet: (_index, className) => `<button type="button" class="${className}"></button>`,
      },
      a11y: {
        paginationBulletMessage: gallery.dataset.paginationLabel || '{{index}}',
      },
    });

    const updateToggle = () => {
      toggle.setAttribute('aria-label', toggle.dataset[paused ? 'playLabel' : 'pauseLabel']);
      toggle.firstElementChild.textContent = paused ? '▶' : 'Ⅱ';
    };

    toggle.addEventListener('click', () => {
      paused = !paused;
      if (paused) slider.autoplay.stop();
      else slider.autoplay.start();
      updateToggle();
    });

    gallery.closest('.hero').addEventListener('focusin', () => {
      paused = true;
      slider.autoplay.stop();
      updateToggle();
    });

    reducedMotion.addEventListener('change', () => {
      slider.params.speed = reducedMotion.matches ? 0 : 600;
      if (reducedMotion.matches) {
        paused = true;
        slider.autoplay.stop();
        updateToggle();
      }
    });
    updateToggle();
  });
}
