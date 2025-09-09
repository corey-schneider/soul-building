import "@hotwired/turbo-rails";
import "@fortawesome/fontawesome-free/js/all";
import PhotoSwipeLightbox from 'photoswipe/lightbox';
import "trix"
import "@rails/actiontext"

document.addEventListener('turbo:load', () => {
  const lightbox = new PhotoSwipeLightbox({
    gallery: '#gallery',
    children: 'a.gallery-item',
    pswpModule: () => import('photoswipe')
  });
  lightbox.init();
});

document.addEventListener('turbo:load', function() {
  const phoneContainer = document.getElementById('phone-container');
  if (phoneContainer) {
    const siteKey = phoneContainer.dataset.siteKey;
    if (!siteKey) {
      console.error('reCAPTCHA site key not found. Did you add the data-site-key attribute?');
      phoneContainer.innerHTML = '<span class="text-red-500">Configuration error.</span>';
      return;
    }
    if (typeof grecaptcha === 'undefined' || typeof grecaptcha.ready !== 'function') {
      console.error('reCAPTCHA library (grecaptcha) not found.');
      phoneContainer.innerHTML = '<span class="text-red-500">Error: reCAPTCHA script failed to load.</span>';
      return;
    }
    grecaptcha.ready(function() {
      grecaptcha.execute(siteKey, { action: 'show_phone' }).then(function(token) {
        const csrfTokenMeta = document.querySelector('meta[name="csrf-token"]');
        if (!csrfTokenMeta) {
          console.error('CSRF token meta tag not found.');
          return;
        }
        fetch('/show_phone_number', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfTokenMeta.content
          },
          body: JSON.stringify({ 'g-recaptcha-response': token })
        }).then(response => {
          if (!response.ok) {
            console.error('Server responded with an error:', response.status, response.statusText);
            return Promise.reject('Server error');
          }
          return response.json();
        }).then(data => {
          if (data.phone_number) {
            phoneContainer.innerHTML = `
            <strong>Call us at:</strong>
            <br>
            <a href="tel:${data.phone_number}" class="text-2xl font-semibold text-gray-800">${data.phone_number}</a>
            <br>
            <p class="tw-text-gray-500 tw-py-3">Or use the form below to submit your inquiry.</p>
            `;
          }
        }).catch(error => {
          phoneContainer.innerHTML = '<span></span>';
        });
      });
    });
  }
});

