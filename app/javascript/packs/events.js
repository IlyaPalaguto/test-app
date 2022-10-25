import PasswordMatching from "../utilities/passwordmatching.js";
import Sorting from "../utilities/sorting.js";

document.addEventListener("turbolinks:load", function () {
  const passwordConfirmation = document.getElementById(
    "user_password_confirmation"
  );
  const sorting = document.getElementById("testsSorting");

  if (passwordConfirmation) {
    const newUserForm = document.getElementById("new_user");
    const password = document.getElementById("user_password");

    newUserForm.addEventListener("input", function (ev) {
      new PasswordMatching(ev, password, passwordConfirmation);
    });
  }

  if (sorting) {
    sorting.addEventListener("click", function (ev) {
      new Sorting(ev, sorting);
    });
  }
});
