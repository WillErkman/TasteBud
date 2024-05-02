class Section < ApplicationRecord
  # Relations
  belongs_to :recipe
  has_many :ingredient_lists
  has_many :ingredients, through: :ingredient_lists
  has_many :procedures
end
