import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  initialize() {
  }
  connect() {
  }
  toggleForm(event){
    event.preventDefault();
    event.stopPropagation();
    const formID = event.params["form"];
    const commentBodyID = event.params["body"];
    const form = document.getElementById(formID);
    const commentBody = document.getElementById(commentBodyID);
    form.classList.toggle("d-none");
    commentBody.classList.toggle("d-none");
  }
}
