import PasswordMatching from "../utilities/passwordmatching.js";
import Sorting from "../utilities/sorting.js";
import { startTimer } from "../utilities/timer.js";

document.addEventListener("turbolinks:load", function () {
  const timer = document.getElementById("timer");

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

  if (timer) {
    startTimer(timer);
  }
});
