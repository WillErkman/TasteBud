class CreateRecipeNutrients < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_nutrients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :nutrient, null: false, foreign_key: true
      t.integer :quantity
      t.integer :unit, default: 0

      t.timestamps
    end
  end
end
