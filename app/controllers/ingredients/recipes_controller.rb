class Ingredients::RecipesController < ApplicationController
	before_action :set_ingredient

	def index
		@recipes = @ingredient.recipes
	end

	private
		def set_ingredient
			@ingredient = Tag.find(params[:ingredient_id])
		end
end
