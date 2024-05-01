class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
