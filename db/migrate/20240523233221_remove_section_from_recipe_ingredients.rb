class RemoveSectionFromRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    remove_reference :recipe_ingredients, :section, index: true, foreign_key: true
    add_reference :recipe_ingredients, :recipe, index: true, foreign_key: true

  end
end
