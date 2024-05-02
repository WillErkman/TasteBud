USERS_COUNT = 10 # Number of Users
RECIPES_COUNT = 10 # Number of Recipes per User
SECTIONS_COUNT = 1 # Number of Sections/Procedures/IngredientLists per Recipe
INGREDIENT_COUNT = 8 # Number of Ingredients per Recipe/Section/IngredientList
TAGS_COUNT = 10 # Number of Tags per Recipe
ADMIN = User.create!(username: "Admin", email: "admin@admin.com", password: "admin1", admin: true) # Administrator

def ingredient_params # Returns array of populated Ingredient params hash
	{ name: Faker::Food.ingredient }
end

def ingredient_lists_params # Returns array of populated IngredientLists params hashes
	INGREDIENT_COUNT.times.map do |i|
		{ quantity: Faker::Food.measurement,
		  ingredient_attributes: ingredient_params }
	end
end

def procedure_params # Returns a populated Procedure params hash
	{ content: Faker::Lorem.paragraphs(number: 4) }
end

def sections_params # Returns array of populated Sections params hashes
	SECTIONS_COUNT.times.map do |i|
		{ title: Faker::Food.dish,
		  description: Faker::Food.description,
		  procedure_attributes: procedure_params,
		  ingredient_lists_attributes: ingredient_lists_params }
	end
end

def nutrition_params # Returns a populated Nutrition params hash
	{ calories: "#{Faker::Number.decimal(l_digits: 2)}Kcal",
	  protein: "#{Faker::Number.decimal(l_digits: 2)}g",
	  carbs: "#{Faker::Number.decimal(l_digits: 2)}g",
	  sugar: "#{Faker::Number.decimal(l_digits: 2)}g",
	  fiber: "#{Faker::Number.decimal(l_digits: 2)}g",
	  fat: "#{Faker::Number.decimal(l_digits: 2)}g",
	  saturated_fat: "#{Faker::Number.decimal(l_digits: 2)}g",
	  unsaturated_fat: "#{Faker::Number.decimal(l_digits: 2)}g",
	  cholesterol: "#{Faker::Number.decimal(l_digits: 2)}g" }
end

def recipe_params # Returns a populated Recipe params hash
	{ title: Faker::Food.dish,
	  cook_time: "#{Faker::Number.between(from: 0, to: 5)}H#{Faker::Number.between(from: 5, to: 55)}M",
	  prep_time: "#{Faker::Number.between(from: 0, to: 5)}H#{Faker::Number.between(from: 5, to: 55)}M",
	  total_time: "#{Faker::Number.between(from: 0, to: 5)}H#{Faker::Number.between(from: 5, to: 55)}M",
	  description: Faker::Food.description,
	  yield: Faker::Food.measurement,
	  sections_attributes: sections_params,
	  nutrition_attributes: nutrition_params }
end

# Users
USERS_COUNT.times do
	User.create!(
		username: Faker::Internet.username(specifier: 4..20),
		email: Faker::Internet.email,
		password: Faker::Internet.password
	)
end

# Recipes
User.all.each do |user, i|
	user.recipes.create!(recipe_params)
end







