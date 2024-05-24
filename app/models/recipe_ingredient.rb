class RecipeIngredient < ApplicationRecord
	# attribute :ingredient_name, :string

	# Relations
	belongs_to :ingredient, inverse_of: :recipe_ingredients
	belongs_to :recipe, inverse_of: :recipe_ingredients

	# Nested ingredient creation
	accepts_nested_attributes_for :ingredient

	# Callbacks
	before_validation :find_or_create_ingredient

	# Validations
	validates :quantity, length: { in: 2..50 }
	validates :ingredient_name, presence: true
	validates :ingredient_id, uniqueness: { scope: :recipe_id, message: "has already been added to this recipe" }

	# Methods
	def ingredient_attributes=(ingredient_attributes)
		self.ingredient = Ingredient.find_or_create_by ingredient_attributes
	end

	private

		def find_or_create_ingredient
			self.ingredient = Ingredient.find_or_create_by(name: self.ingredient.name)
			# self.ingredient = Ingredient.find_or_create_by(name: self.ingredient_name)
		end
end
