class Ingredient < ApplicationRecord
	# Relations
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients

	# Validations

	# Methods

end
