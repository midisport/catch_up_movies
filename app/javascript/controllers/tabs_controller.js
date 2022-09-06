import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["follows", "bookings", "watchlist", "btn", "editDiv", "editBtn"]

  connect() {
    console.log("Tabs controller is active!")
  }

  reveal() {
    this.btnTargets.forEach(btn => {
      btn == event.target ? btn.classList.add("tab_btn-active") : btn.classList.remove("tab_btn-active")

    });
    switch(event.target.id) {
      case "follows-btn" :
        this.followsTarget.classList.remove("d-none")
        this.#hide(this.bookingsTarget)
        this.#hide(this.watchlistTarget)
        this.editBtnTarget.classList.add("disappear")
        break;
      case "bookings-btn" :
        this.bookingsTarget.classList.remove("d-none")
        this.#hide(this.followsTarget)
        this.#hide(this.watchlistTarget)
        this.editBtnTarget.classList.add("disappear")
        break;
      case "watchlist-btn" :
        this.watchlistTarget.classList.remove("d-none")
        this.#hide(this.bookingsTarget)
        this.#hide(this.followsTarget)
        this.editBtnTarget.classList.remove("disappear")
        break;
    }
  }

  edit() {
    this.editDivTargets.forEach(div => div.classList.toggle("d-none"));
    this.editBtnTarget.innerText.toLowerCase() == "edit watchlist" ? this.editBtnTarget.innerText = "Done ?" : this.editBtnTarget.innerText = "Edit Watchlist";
  }

  #hide(item) {
    item.classList.add("d-none")
  }
}
