import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "item", "icon" ]
	static values = { hidden: Boolean, default: false }

	toggle() {
		if ( this.hiddenValue ) {
			this.itemTarget.classList.remove( "collapse" )
			this.itemTarget.classList.add( "collapse.show" )
			this.iconTarget.classList = "bi-chevron-down"
		} else {
			this.itemTarget.classList.remove( "collapse.show" )
			this.itemTarget.classList.add( "collapse" )
			this.iconTarget.classList = "bi-chevron-up"
		}
		this.hiddenValue = !this.hiddenValue;
	}

}
