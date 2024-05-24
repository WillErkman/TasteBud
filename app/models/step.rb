class Step < ApplicationRecord
	# Associations
	belongs_to :section, inverse_of: :steps
	has_one :recipe, through: :section, inverse_of: :steps
	# Normalize content
	normalizes :content, :title, with: -> content { content.strip }

end
