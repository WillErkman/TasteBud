class ChangeRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    drop_table :recipe_ingredients
  end
end
