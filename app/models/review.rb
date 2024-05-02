class Review < ApplicationRecord
  # Relations
  belongs_to :recipe
  belongs_to :user

  # Validations
  validates :rating, numericality: { only_integer: true, in: 1..5 }, presence: true
  validates :comment, length: { maximum: 500 }, allow_blank: true
  # Methods

end
