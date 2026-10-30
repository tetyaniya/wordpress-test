export default function initHeaderMenu() {
  const header = document.querySelector(".site-header");
  const toggle = header?.querySelector(".site-header__toggle");
  const panel = header?.querySelector(".site-header__panel");

  if (!header || !toggle || !panel) return;

  const desktopMedia = window.matchMedia("(min-width: 1024px)");

  function setMenuOpen(open) {
    header.classList.toggle("is-menu-open", open);
    document.body.classList.toggle("ct-menu-open", open);
    toggle.setAttribute("aria-expanded", String(open));
    panel.inert = !desktopMedia.matches && !open;
  }

  toggle.addEventListener("click", () => {
    setMenuOpen(!header.classList.contains("is-menu-open"));
  });

  header.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && header.classList.contains("is-menu-open")) {
      setMenuOpen(false);
      toggle.focus();
    }
  });

  panel.addEventListener("click", (event) => {
    if (event.target.closest("a")) {
      setMenuOpen(false);
    }
  });

  desktopMedia.addEventListener("change", () => setMenuOpen(false));

  header.classList.add("is-menu-ready");
  setMenuOpen(false);
  toggle.hidden = false;
}
