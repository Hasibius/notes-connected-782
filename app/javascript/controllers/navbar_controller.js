import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  updateNavbar() {
    const banner = document.querySelector('.banner')
    const scrollPercentage = banner ? 0.6 : 0.1;

    if (window.scrollY >= (window.innerHeight * scrollPercentage)) {
      this.element.classList.add("navbar-lewagon-very-dark-blue");
    } else {
      this.element.classList.remove("navbar-lewagon-very-dark-blue");
    }
  };
}
