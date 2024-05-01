class Review < ApplicationRecord
  # Relations
  belongs_to :recipe
  belongs_to :user

  # Validations

  # Methods

end
