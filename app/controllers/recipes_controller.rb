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
		@recipe = Recipe.new
		@sections = @recipe.sections
		@recipe_ingredients = @recipe.recipe_ingredients
		@recipe_nutrients = @recipe.recipe_nutrients
		@tags = @recipe.tags
		init_models
	end

	def edit
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to recipes_path, notice: "Success!"
		else
			flash.now[:alert] = @recipe.errors.full_messages
			render :new
		end
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to recipes_path, notice: "Success!"
		else
			flash.now[:alert] = @recipe.errors.full_messages
			render :edit
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

		# Use callbacks to share common setup or constraints between actions.
		def set_recipe
			@recipe = Recipe.find(params[:id])
		end

		# Only allow a list of trusted parameters through.
		def recipe_params
			params.require(:recipe).permit(:title, :prep_time, :cook_time, :total_time, :description, :yield,
			                               sections_attributes: [:title, :description,
			                                                     steps_attributes: [:title, :content, :position]],
			                               recipe_nutrients_attributes: [:quantity, :unit,
			                                                             nutrient_attributes: [:name]],
			                               recipe_ingredients_attributes: [:quantity, :unit,
			                                                               ingredient_attributes: [:name]],
			                               tags_attributes: [:name])
		end
end
