document.addEventListener("turbolinks:load", function () {
  var titleControl = document.querySelector("#titleSorting");
  var categoryControl = document.querySelector("#categorySorting");

  if (titleControl) {
    titleControl.addEventListener("click", sorting);
  }
  if (categoryControl) {
    categoryControl.addEventListener("click", sorting);
  }
});

function sorting() {
  var cardArray = document.querySelector(".row");

  var cards = array.querySelectorAll(".col");

  var arrows = this.parentNode.querySelectorAll(".octicon");
  var arrowUp = this.querySelector(".octicon-arrow-up");
  var arrowDown = this.querySelector(".octicon-arrow-down");

  var sortedCards = [];

  const sortingFunc = {
    categorySortingAsc: categorySortingAsc,
    categorySortingDesc: categorySortingDesc,
    titleSortingAsc: titleSortingAsc,
    titleSortingDesc: titleSortingDesc,
  };

  for (var i = 0; i < cards.length; i++) {
    sortedCards.push(cards[i]);
  }

  if (arrowDown.classList.contains("hide")) {
    hideArrows(arrows);
    arrowDown.classList.remove("hide");
    sortedCards.sort(sortingFunc[`${this.id}Asc`]);
  } else {
    hideArrows(arrows);
    arrowUp.classList.remove("hide");
    sortedCards.sort(sortingFunc[`${this.id}Desc`]);
  }

  var sortedCardArray = document.createElement("div");
  sortedCardArray.classList.add("row", "row-cols-3", "mt-3");

  for (var i = 0; i < sortedCards.length; i++) {
    sortedCardArray.appendChild(sortedCards[i]);
  }

  cardArray.parentNode.replaceChild(sortedCardArray, cardArray);
}

function hideArrows(arrows) {
  for (var i = 0; i < arrows.length; i++) {
    arrows[i].classList.add("hide");
  }
}

function titleSortingAsc(card1, card2) {
  var title1 = card1.querySelector(".card-title").textContent;
  var title2 = card2.querySelector(".card-title").textContent;

  if (title1 > title2) {
    return 1;
  }
  if (title1 < title2) {
    return -1;
  }
  return 0;
}

function titleSortingDesc(card1, card2) {
  var title1 = card1.querySelector(".card-title").textContent;
  var title2 = card2.querySelector(".card-title").textContent;

  if (title1 < title2) {
    return 1;
  }
  if (title1 > title2) {
    return -1;
  }
  return 0;
}

function categorySortingAsc(card1, card2) {
  var category1 = card1.querySelector(".card-subtitle").textContent;
  var category2 = card2.querySelector(".card-subtitle").textContent;

  if (category1 > category2) {
    return 1;
  }
  if (category1 < category2) {
    return -1;
  }
  return 0;
}

function categorySortingDesc(card1, card2) {
  var category1 = card1.querySelector(".card-subtitle").textContent;
  var category2 = card2.querySelector(".card-subtitle").textContent;

  if (category1 < category2) {
    return 1;
  }
  if (category1 > category2) {
    return -1;
  }
  return 0;
}
