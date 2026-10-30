import Accordion from "accordion-js";
import "accordion-js/dist/accordion.min.css";

export default function initFaqAccordion() {
  document.querySelectorAll(".js-faq-accordion").forEach((accordion) => {
    new Accordion(accordion, {
      duration: 400,
      showMultiple: false,
      openOnInit: [0],
    });
  });
}
