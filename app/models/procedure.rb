class Procedure < ApplicationRecord
  # Relations
  belongs_to :section
  has_one :recipe, through: :section
end
