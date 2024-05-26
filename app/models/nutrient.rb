class Nutrient < ApplicationRecord
	# Associations
	has_many :recipe_nutrients
	has_many :recipes, through: :recipe_nutrients

	# Normalize name
	normalizes :name, with: -> name { name.downcase.strip }

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }

end
