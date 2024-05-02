class IngredientList < ApplicationRecord
	# Relations
	belongs_to :ingredient, inverse_of: :ingredient_lists
	belongs_to :section, inverse_of: :ingredient_lists
	has_one :recipe, through: :section, inverse_of: :ingredient_lists

	# Validations
	validates :quantity, length: { in: 2..50 }
	validates :ingredient_id, uniqueness: { scope: :section_id }

	# Methods

end
