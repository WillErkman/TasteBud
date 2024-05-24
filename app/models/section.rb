class Section < ApplicationRecord
	# Relations
	belongs_to :recipe, inverse_of: :sections
	has_many :steps, inverse_of: :section

	# Normalize title and description
	normalizes :title, :description, with: -> attribute { attribute.strip }

	# Nested association creation
	accepts_nested_attributes_for :steps, allow_destroy: true

	# Validations
	validates :title, :description, presence: true
	validates :title, uniqueness: { scope: :recipe_id }

	# Methods
	def steps_attributes=(steps_attributes)
		steps_attributes.values.each do |step_attributes|
			step = steps.find_or_create_by step_attributes
			self.steps << step
		end
	end
end
