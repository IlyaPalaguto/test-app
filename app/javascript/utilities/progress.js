document.addEventListener("turbolinks:load", function () {
  const control = document.querySelector(".progress-bar");

  if (control) {
    let value = control.dataset.progress;
    control.style.width = `${value}%`;
  }
});
