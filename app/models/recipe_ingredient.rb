class RecipeIngredient < ApplicationRecord
  # Relations
  belongs_to :recipe
  belongs_to :ingredient

  # Validations

  # Methods

end
