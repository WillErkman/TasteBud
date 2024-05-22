class AddDescriptionToIngredient < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :description, :text
  end
end
