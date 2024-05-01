class CreateProcedures < ActiveRecord::Migration[7.1]
  def change
    create_table :procedures do |t|
      t.references :section, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
