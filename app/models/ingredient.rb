class Ingredient < ApplicationRecord
	# Relations
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients, inverse_of: :ingredients

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..100 }

	# Normalize name
	normalizes :name, with: -> name { name.downcase.strip }

	# Methods

end
