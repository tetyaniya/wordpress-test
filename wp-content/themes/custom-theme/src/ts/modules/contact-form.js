import IMask from 'imask';

export default function initContactForm() {
  document.querySelectorAll('.wpcf7').forEach((wrapper) => {
    const contactForm = wrapper.querySelector('.contact-form');
    const phone = contactForm?.querySelector('.js-phone-mask[name="your-phone"]');

    if (!phone) return;

    const submit = contactForm.querySelector('.contact-form__submit');
    let successTimer;

    contactForm.addEventListener('successfulSending', () => {
      if (!submit) return;

      queueMicrotask(() => {
        clearTimeout(successTimer);
        submit.value = '✓ Message Sent';
        successTimer = setTimeout(() => {
          submit.value = 'Send Message';
        }, 3000);
      });
    });

    const mask = IMask(phone, {
      mask: '+{38\\0} (00) 000-00-00',
      lazy: true,
    });

    phone.form.addEventListener('reset', () => {
      requestAnimationFrame(() => {
        mask.value = phone.value;
      });
    });

    wrapper.addEventListener('wpcf7mailsent', (event) => {
      if (event.target !== phone.form) return;

      contactForm.dispatchEvent(new CustomEvent('successfulSending', {
        bubbles: true,
      }));
    });
  });
}
