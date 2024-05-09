class Tag < ApplicationRecord
	# Relations
	has_many :recipe_tags, dependent: :destroy
	has_many :recipes, through: :recipe_tags, inverse_of: :tags

	# Normalize name
	normalizes :name, with: -> name { name.downcase.strip }

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# Methods

end
