class Tag < ApplicationRecord
	# Relations
	has_and_belongs_to_many :recipes, inverse_of: :tags

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# Methods

end
