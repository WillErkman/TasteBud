class Nutrition < ApplicationRecord
  # Relations
  belongs_to :recipe, inverse_of: :nutrition

  # Validations

  # Methods

end
