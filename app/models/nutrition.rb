class Nutrition < ApplicationRecord
	# Relations
	belongs_to :recipe, inverse_of: :nutrition

	# Validations
	validates :calories, :protein, :carbs, :sugar, :fiber, :fat, :saturated_fat, :unsaturated_fat, :cholesterol,
	          length: { maximum: 10 },
	          format: { with: /\s*[1-9]\d*\s*(mg | g)?/,
	                    message: "Nutrients must be of the form: '(number)(g)' or '(number)(mg)'" },
	          allow_blank: true

	# Methods
end
