class Procedure < ApplicationRecord
  # Relations
  belongs_to :section, inverse_of: :procedure
  has_one :recipe, through: :section, inverse_of: :procedures

  # Validations
  validates :content, presence: true, length: { in: 1..1000 }

end
