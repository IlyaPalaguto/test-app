import PasswordMatching from "../utilities/passwordmatching.js";
import Sorting from "../utilities/sorting.js";

document.addEventListener("turbolinks:load", function () {
  const newUserForm = document.getElementById("new_user");
  const sorting = document.getElementById("testsSorting");

  if (newUserForm) {
    const password = document.getElementById("user_password");
    const passwordConfirmation = document.getElementById(
      "user_password_confirmation"
    );

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
