class Step < ApplicationRecord
  # Associations
  belongs_to :section

  # Normalize content
  normalizes :content, :title, with: -> content { content.strip }

end
