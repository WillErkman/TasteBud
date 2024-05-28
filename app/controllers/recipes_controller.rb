class RecipesController < ApplicationController
	before_action :set_recipe, only: %i[ show edit update destroy ]

	def index
		@recipes = Recipe.all
	end

	def show
		if @recipe.nil?
			@recipes = Recipe.all
			flash.now[:alert] = "Recipe could not be found"
			render :index
		end
	end

	def new
		@recipe = Recipe.build
		@section = @recipe.sections.build
		@step = @section.steps.build
		# @recipe_ingredient = @recipe.recipe_ingredients.build
		# @recipe_nutrient = @recipe.recipe_nutrients.build
		# @tags = @recipe.tags.build
		# @ingredient = @recipe_ingredient.build_ingredient
		# @nutrient = @recipe_nutrient.build_nutrient
	end

	def edit
	end

	def create
		# @recipe = current_user.recipes.build(recipe_params)
		@recipe = User.first.recipes.build(recipe_params)
		if @recipe.save
			redirect_to recipes_path, notice: "Success!"
		else
			flash.now[:alert] = @recipe.errors.full_messages
			render :new, status: :unprocessable_entity
		end
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to recipes_path, notice: "Success!"
		else
			flash.now[:alert] = @recipe.errors.full_messages
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@recipe.destroy!
		redirect_to recipes_url, notice: "Recipe was successfully destroyed!"
	end

	private

		def init_models
			section = @sections.build
			3.times do
				section.steps.build
			end
			@recipe_ingredients.build
			@recipe_nutrients.build
			@tags.build
		end

		def set_recipe
			@recipe = Recipe.find(params[:id])
		end

		def recipe_params
			params.require(:recipe).permit(:id, :title, :prep_time, :cook_time, :total_time, :description, :yield,
			                               sections_attributes: [:id, :title, :description, :_destroy,
			                                                     steps_attributes: [:id, :title, :content, :position, :_destroy]],
			                               recipe_nutrients_attributes: [:id, :quantity, :unit, :_destroy,
			                                                             nutrient_attributes: [:id, :name]],
			                               recipe_ingredients_attributes: [:id, :quantity, :unit, :_destroy,
			                                                               ingredient_attributes: [:id, :name]],
			                               tags_attributes: [:id, :name])
		end
end
