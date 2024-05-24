class RemoveRecipesTags < ActiveRecord::Migration[7.1]
  def change
    drop_table :recipes_tags
  end
end
