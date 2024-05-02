class Ingredient < ApplicationRecord
	# Relations
	has_many :ingredient_lists
	has_many :recipes, through: :ingredient_lists

	# Validations

	# Methods

end
