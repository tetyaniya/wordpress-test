export default function initPopup() {
  const popup = document.querySelector('.popup');
  if (!popup) return;

  const storageKey = 'ct-enquiry-banner-shown';

  function wasShown() {
    try {
      return localStorage.getItem(storageKey) === '1';
    } catch {
      return false;
    }
  }

  if (wasShown()) return;

  let shown = false;
  let previousFocus;
  const timer = window.setTimeout(openPopup, 15000);

  function stopTriggers() {
    window.clearTimeout(timer);
    window.removeEventListener('scroll', onScroll);
  }

  function openPopup() {
    if (shown || wasShown()) {
      stopTriggers();
      return;
    }

    previousFocus = document.activeElement;
    popup.hidden = false;
    shown = true;
    stopTriggers();

    try {
      localStorage.setItem(storageKey, '1');
    } catch {
      // The in-memory flag still prevents another opening on this page.
    }
  }

  function onScroll() {
    if (window.scrollY >= 1500) openPopup();
  }

  function closePopup() {
    const focusInside = popup.contains(document.activeElement);
    popup.hidden = true;
    if (focusInside && previousFocus?.isConnected) previousFocus.focus({ preventScroll: true });
  }

  popup.querySelector('.popup__close')?.addEventListener('click', closePopup);
  popup.querySelector('.popup__button')?.addEventListener('click', closePopup);
  popup.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') closePopup();
  });

  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();
}
