export default class RuleFormBtn {
  constructor(btns, titleField, attrFields, ev) {
    this.titleField = titleField;
    this.btns = btns;
    this.target = ev.target;
    this.attrFields = attrFields;
  }

  checkRule() {
    const titleType = new RegExp(/all of/, "i");
    if (titleType.test(this.titleField.value)) {
      this.attrFields.classList.remove("hide");
    } else {
      this.attrFields.classList.add("hide");
    }
  }

  showFields() {
    const categoryField =
      document.getElementById("rule_category_id").parentNode;
    const levelField = document.getElementById("rule_level").parentNode;
    if (this.target == this.btns[0]) {
      categoryField.classList.remove("hide");
      levelField.classList.add("hide");
    } else {
      categoryField.classList.add("hide");
      levelField.classList.remove("hide");
    }
  }
}
