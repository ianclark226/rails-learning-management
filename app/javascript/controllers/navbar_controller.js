import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["mobileLinks", "bars", "close"];

  connect() {
    console.log("Navbar controller connected");
  }

  toggle() {
    console.log("Toggling menu...");
  
    this.mobileLinksTarget.classList.toggle("hidden");
    this.mobileLinksTarget.classList.toggle("opacity-0");
    this.mobileLinksTarget.classList.toggle("opacity-100");
    this.barsTarget.classList.toggle("hidden");
    this.closeTarget.classList.toggle("hidden");
  }
}

