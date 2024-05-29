import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "item", "icon" ]
	static values = { toggled: Boolean, default: false }
	static classes = [ "toggled" ]

	toggle() {
		if ( this.toggledValue ) {
			this.itemTarget.classList.remove( this.toggledClass )
		} else {
			this.itemTarget.classList.add( this.toggledClass )
		}
		this.toggledValue = !this.toggledValue;
	}

	toggleWithIcon() {
		if ( this.toggledValue ) {
			this.itemTarget.classList.remove( this.toggledClass )
			this.iconTarget.classList = "bi-chevron-down"
		} else {
			this.itemTarget.classList.add( this.toggledClass )
			this.iconTarget.classList = "bi-chevron-up"
		}
		this.toggledValue = !this.toggledValue;
	}
}
