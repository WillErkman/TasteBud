class CreateIngredientLists < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredient_lists do |t|
      t.references :ingredient, index: true, foreign_key: true
      t.references :section, index: true, foreign_key: true
      t.string :quantity
      t.timestamps
    end
  end
end
