class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :prep_time
      t.string :cook_time
      t.string :total_time
      t.text :description
      t.string :yield
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
