import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["follows", "bookings", "watchlist", "btn"]

  connect() {
    console.log("Tabs controller is active!")
  }

  reveal() {
    this.btnTargets.forEach(btn => {
      btn == event.target ? btn.classList.add("tab_btn-active") : btn.classList.remove("tab_btn-active")
      // btn.classList.remove("tab_btn-active")
    });
    switch(event.target.id) {
      case "follows-btn" :
        this.followsTarget.classList.remove("d-none")
        this.#hide(this.bookingsTarget)
        this.#hide(this.watchlistTarget)
        break;
      case "bookings-btn" :
        this.bookingsTarget.classList.remove("d-none")
        this.#hide(this.followsTarget)
        this.#hide(this.watchlistTarget)
        break;
      case "watchlist-btn" :
        this.watchlistTarget.classList.remove("d-none")
        this.#hide(this.bookingsTarget)
        this.#hide(this.followsTarget)
        break;
    }
  }



  #hide(tab) {
    tab.classList.add("d-none")
  }
}
