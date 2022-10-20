document.addEventListener("turbolinks:load", function () {
  const controls = document.querySelectorAll(".form-inline-link");
  const errors = document.querySelector(".resource-errors");

  if (controls.length) {
    if (errors) {
      const resourceId = errors.dataset.resourceId;
      formInlinekHandler(resourceId);
    }

    for (let i = 0; i < controls.length; i++) {
      controls[i].addEventListener("click", formInlineLinkHandler);
    }
  }
});

function formInlineLinkHandler(event) {
  event.preventDefault();

  const testId = this.dataset.testId;
  formInlinekHandler(testId);
}

function formInlinekHandler(id) {
  const link = document.querySelector(
    `.form-inline-link[data-test-id="${id}"]`
  );
  const form = document.querySelector(`.form-inline[data-test-id="${id}"]`);
  const title = document.querySelector(`.card-title[data-test-id="${id}"]`);

  if (form.classList.contains("hide")) {
    link.textContent = "Cancel";
  } else {
    link.textContent = "Редактировать";
  }
  form.classList.toggle("hide");
  title.classList.toggle("hide");
}
