import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "toggleable" ]
  //connect() {
  // this.element.textContent = "Hello World!"
  //}
  toggle(){
    this.toggleableTarget.classList.toggle('hidden')
  }
}
