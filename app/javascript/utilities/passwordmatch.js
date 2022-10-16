document.addEventListener("turbolinks:load", function () {
  var controlPasswordConfirmation = document.querySelector(
    "#user_password_confirmation"
  );
  var controlPassword = document.querySelector("#user_password");

  if (controlPasswordConfirmation && controlPassword) {
    controlPasswordConfirmation.addEventListener("input", matchPassword);
    controlPassword.addEventListener("input", matchPassword);
  }
});

function matchPassword() {
  if (this.id == "user_password") {
    var password = this.offsetParent.querySelector(
      "#user_password_confirmation"
    );
  } else {
    var password = this.offsetParent.querySelector("#user_password");
  }

  if (this.value == "" || password.value == "") {
    this.classList.remove(this.classList.item(1));
    password.classList.remove(password.classList.item(1));
  } else if (this.value == password.value) {
    this.classList.add("border-success");
    password.classList.add("border-success");

    this.classList.remove("border-danger");
    password.classList.remove("border-danger");
  } else {
    this.classList.remove("border-success");
    password.classList.remove("border-success");

    this.classList.add("border-danger");
    password.classList.add("border-danger");
  }
}
