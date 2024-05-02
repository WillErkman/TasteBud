class IngredientList < ApplicationRecord
	# Relations
	belongs_to :ingredient, inverse_of: :ingredient_lists
	belongs_to :section, inverse_of: :ingredient_lists
	has_one :recipe, through: :section, inverse_of: :ingredient_lists

	accepts_nested_attributes_for :ingredient, allow_destroy: true
end
