class RemoveUserFromRecipe < ActiveRecord::Migration[7.1]
  def change
    remove_reference :recipes, :user, foreign_key: true
  end
end
