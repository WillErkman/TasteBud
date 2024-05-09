class DropNutrition < ActiveRecord::Migration[7.1]
  def change
    drop_table :nutritions
    drop_table :procedures
  end
end
