module ApplicationHelper
	def remove_child_button(name, f, options = {})
		confirm = options[:confirm].nil? ? true : options.delete(:confirm)
		style = options[:class].nil? ? "" : options.delete(:class)
		f.hidden_field(:_destroy) + button_tag(name, type: "button",
		                                       data: {
			                                       action: 'dynamic-forms#removeFromForm',
			                                       dynamic_forms_confirm_param: (confirm ? 'Do you really want to remove this item?' : nil) },
		                                       class: style)
	end

	# options: *table* if element is a table row
	def add_child_button(text, f, association_name, options = {})
		options[:class] ||= ""
		fields = new_child_fields(f, association_name, options)
		button = button_tag(text, type: "button", data: { action: 'dynamic-forms#addToForm', association: association_name }, class: options[:class])
		tag = options[:table] ? :table : :div
		template = content_tag(tag, fields, data: { dynamic_forms_target: "template" }, class: "d-none")
		content_tag(:div, template + button)
	end

	# new_child_fields(form_builder, association_name, *partial*, *object*, *name_of_formbuilder_in_partial*, *partial_locals* )
	def new_child_fields(form_builder, association_name, options = {})
		options[:partial] ||= association_name.to_s.singularize
		options[:form_builder_local] ||= :f
		form_builder.fields_for association_name, options[:object], child_index: "___new_#{association_name}___" do |f|
			render partial: options[:partial], locals: { options[:form_builder_local] => f }
		end
	end
end
