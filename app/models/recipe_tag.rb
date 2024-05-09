class RecipeTag < ApplicationRecord
	# Associations
	belongs_to :recipe
	belongs_to :tag

	# Validations
	validates :tag_id, uniqueness: { scope: :recipe_id, message: "has already been added to this recipe" }
end
