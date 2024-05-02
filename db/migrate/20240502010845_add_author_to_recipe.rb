class AddAuthorToRecipe < ActiveRecord::Migration[7.1]
  def change
    add_reference :recipes, :author, foreign_key: { to_table: :users }, index: true
  end
end
