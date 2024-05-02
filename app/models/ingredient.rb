class Ingredient < ApplicationRecord
	# Relations
	has_many :ingredient_lists
	has_many :recipes, through: :ingredient_lists, inverse_of: :ingredients

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..100 }

	# Methods

end
