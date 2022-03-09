import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "create", "destroy" ];

  // connect() {
  //   console.log('object');
  // };

  createAttendance(event) {
    event.preventDefault();
    event.stopPropagation();
    // console.log("Create called.");
    const event_id = this.destroyTarget.dataset.id;
    // call post route for events#create method
  };

  destroyAttendance(event) {
    event.preventDefault();
    event.stopPropagation();
    // console.log("Destroy called.");
    const event_id = this.destroyTarget.dataset.id;
    // call delete route for events#destroy method
    console.log(this.destroyTarget.outerHTML);
  };
}
