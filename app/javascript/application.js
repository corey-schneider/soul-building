// import "@hotwired/turbo-rails";
import * as bootstrap from "bootstrap";
// import * as trix from 'trix';


// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"
// import 'bootstrap'
// require('jquery')
// import '../assets/stylesheets/application' ///////////////////////////////////////////////
// import PhotoSwipeLightbox from 'photoswipe/dist/photoswipe-lightbox.esm.js';
// import 'photoswipe/dist/photoswipe.css';

// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

// require("trix")
// require("@rails/actiontext")

console.log("hello!");
document.addEventListener('turbolinks:load', () => {
  console.log("turbolinks loaded");
  const lightbox = new PhotoSwipeLightbox({
    gallery: '#gallery',
    children: 'a',
    pswpModule: () => import('photoswipe')
  });
  lightbox.init();
});

document.addEventListener('DOMContentLoaded', function() {
  console.log("dom loaded");
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

