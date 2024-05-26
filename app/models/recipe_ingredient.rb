class RecipeIngredient < ApplicationRecord
	# Relations
	belongs_to :ingredient, inverse_of: :recipe_ingredients
	belongs_to :recipe, inverse_of: :recipe_ingredients

	# Nested ingredient creation
	accepts_nested_attributes_for :ingredient

	# Callbacks
	before_validation :find_or_create_ingredient

	# Validations
	validates :quantity, length: { maximum: 50 }
	validates :ingredient_id, uniqueness: { scope: :recipe_id, message: "has already been added to this recipe" }

	# Methods
	def ingredient_attributes
		self.ingredient.name
	end

	def siblings
		self.recipe.recipe_ingredients.where.not(id: id)
	end

	private

		def find_or_create_ingredient
			self.ingredient = Ingredient.find_or_create_by(name: self.ingredient.name) if self.new_record?
		end
end
