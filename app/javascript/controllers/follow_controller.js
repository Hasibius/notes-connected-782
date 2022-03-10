import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "create", "destroy", "number", "following" ];

  // connect() {
  //   console.log('object');
  // };

  createFollow(event) {
    event.preventDefault();
    event.stopPropagation();

    let headers = new window.Headers({
      Accept: "text/plain",
      "X-Requested-With": "XMLHttpRequest"
    });

    const csrfToken = document.head.querySelector("[name='csrf-token']").content
    if (csrfToken) {
      headers.append("X-CSRF-Token", csrfToken)
    }

    const url = `${this.createTarget.dataset.userId}/follows`;

    // console.log(url);

    // console.log("Create called.");
    // call post route for follows#create method
    fetch(url, {
      headers: headers,
      method: 'POST',
      credentials: 'same-origin',
      body: JSON.stringify({user_id: this.createTarget.dataset.userId})
    })
    .then(response => {
      // console.log(response);
      return response.text()
    })
    .then((data) => {
      // console.log(data)
      this.createTarget.outerHTML = data
    });
    // console.log(this.numberTarget.innerText);
    const num = parseInt(this.numberTarget.innerText.split(" ")[2], 10) + 1;
    let pluralize = num == 1 ? 'person' : 'people';
    this.numberTarget.innerText = `Followed by ${num} ${pluralize}`;
    // console.log(this.numberTarget.innerText);
    this.followingTarget.classList.remove('hidden');
  };

  destroyFollow(event) {
    event.preventDefault();
    event.stopPropagation();

    let headers = new window.Headers({
      Accept: "text/plain",
      "X-Requested-With": "XMLHttpRequest"
    });

    const csrfToken = document.head.querySelector("[name='csrf-token']").content
    if (csrfToken) {
      headers.append("X-CSRF-Token", csrfToken)
    }

    // console.log(csrfToken);

    // console.log("Destroy called."); ${this.destroyTarget.origin}
    // :user_id/follows
    const url = `${this.destroyTarget.dataset.userId}/follows`;
    // console.log(this.destroyTarget);
    // console.log(url);
    // call delete route for follows#destroy method
    fetch(url, {
      headers: headers,
      method: 'DELETE',
      credentials: 'same-origin'
    })
    .then(response => {
      // console.log(response);
      return response.text()
    })
    .then((data) => {
      // console.log(data);
      this.destroyTarget.outerHTML = data
    });
    const num = parseInt(this.numberTarget.innerText.split(" ")[2], 10) - 1;
    let pluralize = num == 1 ? 'person' : 'people';
    this.numberTarget.innerText = `Followed by ${num} ${pluralize}`;
    // console.log(this.numberTarget.innerText);
    this.followingTarget.classList.add('hidden');
  };
}
