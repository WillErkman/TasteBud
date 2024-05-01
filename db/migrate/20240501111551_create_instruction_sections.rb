class CreateInstructionSections < ActiveRecord::Migration[7.1]
  def change
    create_table :instruction_sections do |t|
      t.string :title
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
