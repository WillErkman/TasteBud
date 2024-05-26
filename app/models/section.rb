class Section < ApplicationRecord
	# Relations
	belongs_to :recipe, inverse_of: :sections
	has_many :steps, inverse_of: :section

	# Normalize title and description
	normalizes :title, :description, with: -> attribute { attribute.strip }

	# Nested association creation
	accepts_nested_attributes_for :steps, allow_destroy: true

	# Validations
	validates :title, presence: true, uniqueness: { scope: :recipe_id }
	validates :description, length: { maximum: 500 }, allow_blank: true

	# Methods

end
