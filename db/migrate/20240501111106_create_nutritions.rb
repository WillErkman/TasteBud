class CreateNutritions < ActiveRecord::Migration[7.1]
  def change
    create_table :nutritions do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :sugar
      t.integer :fiber
      t.integer :fat
      t.integer :saturated_fat
      t.integer :unsaturated_fat
      t.integer :cholesterol

      t.timestamps
    end
  end
end
