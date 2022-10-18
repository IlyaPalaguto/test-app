export default class Sorting {
  constructor(ev, parentElement) {
    this.target = ev.target;
    this.arrows = parentElement.querySelectorAll(".octicon");
    this.arrowUp = ev.target.querySelector(".octicon-arrow-up");
    this.arrowDown = ev.target.querySelector(".octicon-arrow-down");
    this.cardArray = document.querySelector(".row");
    this.cards = this.cardArray.querySelectorAll(".col");
    this.sortedCards = [];
    this.sorting();
  }

  sorting() {
    const sortingFunc = {
      categorySortingAsc: this.categorySortingAsc,
      categorySortingDesc: this.categorySortingDesc,
      titleSortingAsc: this.titleSortingAsc,
      titleSortingDesc: this.titleSortingDesc,
    };

    for (let i = 0; i < this.cards.length; i++) {
      this.sortedCards.push(this.cards[i]);
    }

    if (this.arrowDown.classList.contains("hide")) {
      this.hideArrows(this.arrows);
      this.arrowDown.classList.remove("hide");
      this.sortedCards.sort(sortingFunc[`${this.target.id}Asc`]);
    } else {
      this.hideArrows(this.arrows);
      this.arrowUp.classList.remove("hide");
      this.sortedCards.sort(sortingFunc[`${this.target.id}Desc`]);
    }

    const sortedCardArray = document.createElement("div");
    sortedCardArray.classList.add("row", "row-cols-3", "mt-3");

    for (let i = 0; i < this.sortedCards.length; i++) {
      sortedCardArray.appendChild(this.sortedCards[i]);
    }

    this.cardArray.parentNode.replaceChild(sortedCardArray, this.cardArray);
  }

  hideArrows(arrows) {
    for (let i = 0; i < arrows.length; i++) {
      arrows[i].classList.add("hide");
    }
  }

  titleSortingAsc(card1, card2) {
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

  titleSortingDesc(card1, card2) {
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

  categorySortingAsc(card1, card2) {
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

  categorySortingDesc(card1, card2) {
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
}
