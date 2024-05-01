class CreateInstructions < ActiveRecord::Migration[7.1]
  def change
    create_table :instructions do |t|
      t.references :instruction_section, null: false, foreign_key: true
      t.text :content
      t.integer :order

      t.timestamps
    end
  end
end
