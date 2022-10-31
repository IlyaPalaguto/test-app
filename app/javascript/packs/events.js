import PasswordMatching from "../utilities/passwordmatching.js";
import Sorting from "../utilities/sorting.js";
import RuleFormBtn from "../utilities/ruleformbtn";

document.addEventListener("turbolinks:load", function () {
  const ruleForm = document.querySelector(".create-rule");

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

  if (ruleForm) {
    const btns = ruleForm.querySelectorAll("button");
    const titleField = document.getElementById("rule_title");
    const attrFields = ruleForm.querySelector(".attribute");
    titleField.addEventListener("input", function (ev) {
      new RuleFormBtn(btns, titleField, attrFields, ev).checkRule();
    });
    for (let i = 0; i < btns.length; i++) {
      btns[i].addEventListener("click", function (ev) {
        new RuleFormBtn(btns, titleField, attrFields, ev).showFields();
      });
    }
  }
});
