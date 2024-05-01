class DropInstructionSection < ActiveRecord::Migration[7.1]
  def change
    drop_table :instruction_sections
  end
end
