import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "create", "destroy", "number", "going" ];

  // connect() {
  //   console.log('object');
  // };

  createAttendance(event) {
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

    const url = this.createTarget.pathname

    // console.log(this.createTarget);

    // console.log("Create called.");
    // call post route for events#create method
    fetch(url, {
      headers: headers,
      method: 'POST',
      credentials: 'same-origin',
      body: JSON.stringify({event_id: this.createTarget.dataset.id})
    })
    .then(response => {
      // console.log(response);
      return response.text()
    })
    .then((data) => {
      // console.log(data)
      this.createTarget.outerHTML = data
    });
    const num = parseInt(this.numberTarget.innerText, 10) + 1;
    let pluralize = num == 1 ? 'person' : 'people';
    this.numberTarget.innerText = `${num} ${pluralize} going`
    // console.log(this.numberTarget.innerText);
    this.goingTarget.classList.remove('hidden');
  };

  destroyAttendance(event) {
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
    const url = `${this.destroyTarget.pathname}`
    // console.log(this.destroyTarget);
    // console.log(url);
    // call delete route for events#destroy method
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
    const num = parseInt(this.numberTarget.innerText, 10) - 1;
    let pluralize = num == 1 ? 'person' : 'people';
    this.numberTarget.innerText = `${num} ${pluralize} going`
    // console.log(this.numberTarget.innerText);
    this.goingTarget.classList.add('hidden');
  };
}
