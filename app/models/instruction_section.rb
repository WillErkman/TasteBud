class InstructionSection < ApplicationRecord
  # Relations
  belongs_to :recipe
  has_many :instructions

  # Validations

  # Methods

end
