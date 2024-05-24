class ChangeRecipeTagName < ActiveRecord::Migration[7.1]
  def change
    rename_table :recipe_tags, :recipes_tags
  end
end
