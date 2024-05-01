class CreateJoinTableTagRecipe < ActiveRecord::Migration[7.1]
  def change
    create_join_table :tags, :recipes do |t|
      t.index [:tag_id, :recipe_id], unique: true
      t.index [:recipe_id, :tag_id], unique: true
    end
  end
end
