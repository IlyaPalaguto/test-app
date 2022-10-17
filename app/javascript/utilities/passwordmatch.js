import PasswordField from "./passwordfield.js";
let password;
let passwordConfirmation;

document.addEventListener("turbolinks:load", function () {
  const control = document.getElementById("new_user");
  if (control) {
    password = new PasswordField(document.getElementById("user_password"));
    passwordConfirmation = new PasswordField(
      document.getElementById("user_password_confirmation")
    );
    control.addEventListener("input", matchPassword);
  }
});

function matchPassword(element) {
  if (
    element.target == password.element ||
    element.target == passwordConfirmation.element
  ) {
    if (password.empty() || passwordConfirmation.empty()) {
      password.removeBorder();
      passwordConfirmation.removeBorder();
    } else if (passwordConfirmation.even(password)) {
      password.addBorder("success");
      passwordConfirmation.addBorder("success");
    } else {
      password.addBorder("danger");
      passwordConfirmation.addBorder("danger");
    }
  }
}
