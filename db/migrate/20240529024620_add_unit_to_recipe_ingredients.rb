class AddUnitToRecipeIngredients < ActiveRecord::Migration[7.1]
	def change
		add_column :recipe_ingredients, :unit, :string
		add_column :recipe_ingredients, :notes, :string
	end
end
