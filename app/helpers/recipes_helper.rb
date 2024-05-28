module RecipesHelper
	def new_recipe_ingredient
		@recipe.recipe_ingredients.build(ingredient: Ingredient.new)
	end

	def new_recipe_nutrient
		@recipe.recipe_nutrients.build(nutrient: Nutrient.new)
	end

	def new_tag
		@recipe.tags.build
	end

	def new_section
		section = @recipe.sections.build
		section.steps.build
		section
	end

	def new_step(section)
		section.steps.build
	end
end
