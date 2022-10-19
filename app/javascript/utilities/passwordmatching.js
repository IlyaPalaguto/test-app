export default class PasswordMatching {
  constructor(ev, password, passwordConfirmation) {
    this.password = password;
    this.passwordConfirmation = passwordConfirmation;
    this.target = ev.target;
    this.checkMatch();
  }

  checkMatch() {
    if (
      this.target == this.password ||
      this.target == this.passwordConfirmation
    ) {
      if (this.empty()) {
        this.removeBorder();
      } else if (this.password.value == this.passwordConfirmation.value) {
        this.addBorder("success");
      } else {
        this.addBorder("danger");
      }
    }
  }

  removeBorder() {
    this.password.classList.remove(/border-\S*/.exec(this.password.classList));
    this.passwordConfirmation.classList.remove(
      /border-\S*/.exec(this.passwordConfirmation.classList)
    );
  }

  addBorder(type) {
    this.password.classList.remove(/border-\S*/.exec(this.password.classList));
    this.passwordConfirmation.classList.remove(
      /border-\S*/.exec(this.passwordConfirmation.classList)
    );

    this.password.classList.add(`border-${type}`);
    this.passwordConfirmation.classList.add(`border-${type}`);
  }

  empty() {
    if (this.password.value == "" || this.passwordConfirmation.value == "") {
      return true;
    } else {
      return false;
    }
  }
}
