module ApplicationHelper
	# These methods handle child forms where there's a
	# one-to-x relationship.
	def remove_child_link(name, f, options = {})
		_remove_child_link_with_class(name, f, 'remove-child-link', options)
	end

	def remove_child_button(name, f, options = {})
		_remove_child_link_with_class(name, f, 'btn btn-outline-danger btn-sm remove-child-button', options)
	end

	def _remove_child_link_with_class(name, f, class_str, options = {})
		confirm = options.delete(:confirm)
		confirm = confirm.nil? ? true : confirm
		style = options.delete(:class)
		style = style.nil? ? "" : style
		f.hidden_field(:_destroy) + link_to(name, '', data: { action: 'dynamic-forms#removeFromForm', dynamic_forms_confirm_param: (confirm ? 'Do you really want to remove this item?' : nil) }, class: "remove-child-link #{class_str} #{style}")
	end

	def add_child_button1(text, f, association_name, options = {})
		_add_child_link_with_class(text, f, association_name, 'btn btn-success btn-sm', options)
	end

	# def add_child_button(text, f, association_name, options = {})
	# 	options[:class] ||= ""
	# 	fields = new_child_fields(f, association_name, options)
	# 	button = button_tag(text, type: "button", data: {
	# 		action: 'dynamic-forms#addToForm',
	# 		association: association_name,
	# 		dynamic_forms_template_param: h(fields) },
	# 	                    class: options[:class])
	# end
	def add_child_button(text, f, association_name, options = {})
		options[:class] ||= ""
		fields = new_child_fields(f, association_name, options)
		button = button_tag(text, type: "button", data: {
			action: 'dynamic-forms#addToForm',
			association: association_name },
		                    class: options[:class])
		template = content_tag(:div, fields, data: { dynamic_forms_target: "template" }, class: "d-none")
		content_tag(:div, template + button)
	end

	# In the following method, we use "h('' + item)" in order to remove
	# the "html_safe" flag from the string and cause it to always be
	# escaped.
	def _add_child_link_with_class(text, f, association_name, class_str, options = {})
		fields = new_child_fields(f, association_name, options)
		link = link_to(text, '#',
		               data: {
			               action: 'dynamic-forms#addToForm',
			               dynamic_forms_method_param: association_name,
			               dynamic_forms_template_param: h('' + fields) },
		               class: 'add-child-link ' + class_str)

		raw (fields + link)
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
