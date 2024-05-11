class RecipeIngredient < ApplicationRecord
	# Relations
	belongs_to :ingredient, inverse_of: :recipe_ingredients
	belongs_to :section, inverse_of: :recipe_ingredients
	has_one :recipe, through: :section, inverse_of: :recipe_ingredients
	accepts_nested_attributes_for :ingredient

	# Callbacks
	before_validation :find_or_create_ingredient

	# Validations
	validates :quantity, length: { in: 2..50 }
	validates :ingredient_id, uniqueness: { scope: :section_id, message: "has already been added to this section" }

	# Methods
	def find_or_create_ingredient
		self.ingredient = Ingredient.find_or_create_by(name: self.ingredient.name)
	end
end
