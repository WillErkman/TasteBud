class Ingredient < ApplicationRecord
	# Relations
	has_many :ingredient_lists
	has_many :recipes, through: :ingredient_lists, inverse_of: :ingredients

	# Validations

	# Methods

end
