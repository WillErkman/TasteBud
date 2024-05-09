class RenameIngredientList < ActiveRecord::Migration[7.1]
  def change
    rename_table :ingredient_lists, :recipe_ingredients
  end
end
