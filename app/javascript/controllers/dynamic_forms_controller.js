import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "list", "item", "template" ]

	addToForm( e ) {
		e.preventDefault();
		let template = this.templateTarget.innerHTML
		this.listTarget.insertAdjacentHTML( "beforeend", template )
		console.log( e.params.template )
	}

	removeFromForm( e ) {

	}

}

const regex = []
