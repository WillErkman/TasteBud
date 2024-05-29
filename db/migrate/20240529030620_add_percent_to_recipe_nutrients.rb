class AddPercentToRecipeNutrients < ActiveRecord::Migration[7.1]
	def change
		add_column :recipe_nutrients, :percent_daily_value, :integer
	end
end
