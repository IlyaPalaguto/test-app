document.addEventListener("turbolinks:load", function () {
  const control = document.getElementById("testsSorting");

  if (control) {
    control.addEventListener("click", sorting);
  }
});

function sorting(e) {
  const cardArray = document.querySelector(".row");

  const cards = cardArray.querySelectorAll(".col");

  const arrows = this.querySelectorAll(".octicon");
  const arrowUp = e.target.querySelector(".octicon-arrow-up");
  const arrowDown = e.target.querySelector(".octicon-arrow-down");

  const sortedCards = [];

  const sortingFunc = {
    categorySortingAsc: categorySortingAsc,
    categorySortingDesc: categorySortingDesc,
    titleSortingAsc: titleSortingAsc,
    titleSortingDesc: titleSortingDesc,
  };

  for (let i = 0; i < cards.length; i++) {
    sortedCards.push(cards[i]);
  }

  if (arrowDown.classList.contains("hide")) {
    hideArrows(arrows);
    arrowDown.classList.remove("hide");
    sortedCards.sort(sortingFunc[`${e.target.id}Asc`]);
  } else {
    hideArrows(arrows);
    arrowUp.classList.remove("hide");
    sortedCards.sort(sortingFunc[`${e.target.id}Desc`]);
  }

  const sortedCardArray = document.createElement("div");
  sortedCardArray.classList.add("row", "row-cols-3", "mt-3");

  for (let i = 0; i < sortedCards.length; i++) {
    sortedCardArray.appendChild(sortedCards[i]);
  }

  cardArray.parentNode.replaceChild(sortedCardArray, cardArray);
}

function hideArrows(arrows) {
  for (let i = 0; i < arrows.length; i++) {
    arrows[i].classList.add("hide");
  }
}

function titleSortingAsc(card1, card2) {
  const title1 = card1.querySelector(".card-title").textContent;
  const title2 = card2.querySelector(".card-title").textContent;

  if (title1 > title2) {
    return 1;
  }
  if (title1 < title2) {
    return -1;
  }
  return 0;
}

function titleSortingDesc(card1, card2) {
  const title1 = card1.querySelector(".card-title").textContent;
  const title2 = card2.querySelector(".card-title").textContent;

  if (title1 < title2) {
    return 1;
  }
  if (title1 > title2) {
    return -1;
  }
  return 0;
}

function categorySortingAsc(card1, card2) {
  const category1 = card1.querySelector(".card-subtitle").textContent;
  const category2 = card2.querySelector(".card-subtitle").textContent;

  if (category1 > category2) {
    return 1;
  }
  if (category1 < category2) {
    return -1;
  }
  return 0;
}

function categorySortingDesc(card1, card2) {
  const category1 = card1.querySelector(".card-subtitle").textContent;
  const category2 = card2.querySelector(".card-subtitle").textContent;

  if (category1 < category2) {
    return 1;
  }
  if (category1 > category2) {
    return -1;
  }
  return 0;
}
