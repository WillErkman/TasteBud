class RecipeNutrient < ApplicationRecord
	# Associations
	belongs_to :recipe
	belongs_to :nutrient

	# Unit enum
	enum unit: {
		gram: 0,
		milligram: 1,
		percent_daily_value: 2
	}

	# Validations
	validates :nutrient_id, uniqueness: { scope: :recipe_id, message: "has already been added to the recipe" }
	validates :quantity, numericality: { only_integer: true, greater_than: 0 }
	validates :unit, numericality: { only_integer: true, in: 0..2 }

end
