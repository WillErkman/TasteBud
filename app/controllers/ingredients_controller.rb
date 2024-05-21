class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show ]

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
    @recipes = @ingredient.recipes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.fetch(:ingredient, {})
    end
end
