class DropInstructions < ActiveRecord::Migration[7.1]
  def change
    drop_table :instructions
  end
end
