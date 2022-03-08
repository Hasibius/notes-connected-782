import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    const banner = document.querySelector('.banner')
    if (banner) {
      // set multiplier equal to banner height in vh percentage
      if (window.scrollY >= (window.innerHeight * 0.6)) {
        this.element.classList.add("navbar-lewagon-very-dark-blue");
      } else {
        this.element.classList.remove("navbar-lewagon-very-dark-blue");
      }
    }
  };
}
