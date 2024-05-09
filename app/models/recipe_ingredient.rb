class RecipeIngredient < ApplicationRecord
	# Relations
	belongs_to :ingredient, inverse_of: :RecipeIngredient
	belongs_to :section, inverse_of: :RecipeIngredient
	has_one :recipe, through: :section, inverse_of: :RecipeIngredient

	# Validations
	validates :quantity, length: { in: 2..50 }
	validates :ingredient_id, uniqueness: { scope: :section_id, message: "has already been added to this section" }

	# Methods

end
