class Tag < ApplicationRecord
	# Relations
	has_and_belongs_to_many :recipes,  inverse_of: :tags

	# Normalize name
	normalizes :name, with: -> name { name.downcase.strip }

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# Methods

end
