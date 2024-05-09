class CreateSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :steps do |t|
      t.references :section, null: false, foreign_key: true
      t.integer :position
      t.text :content

      t.timestamps
    end
  end
end
