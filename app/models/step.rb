class Step < ApplicationRecord
  # Associations
  belongs_to :section

  # Normalize content
  normalizes :content, with: -> content { content.strip }

end
