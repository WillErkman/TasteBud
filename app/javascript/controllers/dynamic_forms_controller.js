import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "list", "item", "template" ]
	static values = { count: Number }
	static regex = {
		association: /_{3}(new)_[a-zA-Z]+(_[a-zA-Z]+)*_{3}/,
		index: /\[\d+\]/,
		dateNow: /\d+/
	}

	addToForm( e ) {
		let newNode = this.templateTarget.firstChild.cloneNode( true );
		newNode.id = Date.now();
		this.listTarget.insertAdjacentElement( "beforeend", newNode )
	}

	removeFromForm( e ) {
		let target = e.currentTarget;
		this.setDestroy( target );
		let parent = target.closest( '[data-dynamic-forms-target="item"]' );
		parent.style.display = 'none';
	}

	setDestroy( target ) {
		let destroy = target.parentNode.querySelector( 'input[type="hidden"]' );
		destroy.value = true;
	}
}

