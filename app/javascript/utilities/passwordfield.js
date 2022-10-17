export default class PasswordField {
  constructor(element) {
    this.element = element;
    this.classList = element.classList;
  }

  removeBorder() {
    this.classList.remove(/border-\S*/.exec(this.classList));
  }

  addBorder(type) {
    this.classList.remove(/border-\S*/.exec(this.classList));

    this.classList.add(`border-${type}`);
  }

  even(password) {
    return this.element.value == password.element.value;
  }

  empty() {
    if (this.element.value == "") {
      return true;
    } else {
      return false;
    }
  }
}
