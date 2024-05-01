class Recipe < ApplicationRecord
  # Relations
  belongs_to :author, class_name: 'User'
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews
  has_many :instruction_sections
  has_many :instructions, through: :instruction_sections

  # Validations

  # Methods

end
