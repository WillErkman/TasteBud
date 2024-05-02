class IngredientList < ApplicationRecord
	# Relations
	belongs_to :ingredient
	belongs_to :recipe
end
