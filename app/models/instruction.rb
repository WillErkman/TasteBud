class Instruction < ApplicationRecord
  # Relations
  belongs_to :instruction_section
  has_one :recipe, through: :instruction_section

  # Validations

  # Methods

end
