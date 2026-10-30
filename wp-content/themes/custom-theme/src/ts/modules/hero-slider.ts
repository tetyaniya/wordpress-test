import Swiper from 'swiper';
import { A11y, Navigation, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/a11y';

export default function initHeroSlider(): void {
  document.querySelectorAll<HTMLElement>('[data-hero-slider]').forEach((gallery) => {
    const previous = gallery.querySelector<HTMLButtonElement>('.hero__previous');
    const next = gallery.querySelector<HTMLButtonElement>('.hero__next');
    const pagination = gallery.querySelector<HTMLElement>('.hero__pagination');
    if (!previous || !next || !pagination) return;

    new Swiper(gallery, {
      modules: [Navigation, Pagination, A11y],
      slidesPerView: 1,
      spaceBetween: 16,
      speed: window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 0 : 300,
      navigation: { prevEl: previous, nextEl: next },
      pagination: {
        el: pagination,
        clickable: true,
        bulletElement: 'button',
        renderBullet: (_index, className) => `<button type="button" class="${className}"></button>`,
      },
      a11y: {
        prevSlideMessage: previous.getAttribute('aria-label') || '',
        nextSlideMessage: next.getAttribute('aria-label') || '',
        paginationBulletMessage: gallery.dataset.paginationLabel || '{{index}}',
      },
    });
  });
}
