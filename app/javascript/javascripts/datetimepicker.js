import flatpickr from 'flatpickr/dist/flatpickr';

document.addEventListener("turbo:load", function() {
  flatpickr('.js-datetime-picker', {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  })
});
