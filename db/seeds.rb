#  Resource Sizes and Special Resources
USERS_COUNT = 100 # Number of Users
RECIPES_COUNT = 10 # Number of Recipes per User
SECTIONS_COUNT = 2 # Number of Sections/Procedures/IngredientLists per Recipe
INGREDIENT_COUNT = 8 # Number of Ingredients per Recipe/Section/RecipeIngredient
TAGS_COUNT = 3 # Number of Tags per Recipe
REVIEWS_COUNT = 9 # Number of Reviews per Recipe
NUTRIENTS_COUNT = 8 # Number of RecipeNutrients per Recipe
STEPS_COUNT = 6 # Number of Steps per Section
ADMIN_PARAMS = { username: "Admin", email: "admin@admin.com", password: "admin1", admin: true } # Administrator info

#  Parameter creation methods

def ingredient_params
	{ name: Faker::Food.ingredient,
	  description: Faker::Food.description }
end

def recipe_ingredients_params # Returns array of populated RecipeIngredient params hashes
	INGREDIENT_COUNT.times.map do
		{ quantity: Faker::Food.measurement,
		  ingredient_attributes: { name: Faker::Food.ingredient,
		                           description: Faker::Food.description } }
	end
end

def steps_params # Returns a populated Procedure params hash
	STEPS_COUNT.times.map do |i|
		{ position: i + 1,
		  title: Faker::Lorem.sentence,
		  content: Faker::Lorem.paragraph(sentence_count: 8, supplemental: true, random_sentences_to_add: 3) }
	end
end

def sections_params # Returns array of populated Section params hashes
	SECTIONS_COUNT.times.map do |i|
		{ title: Faker::Food.dish,
		  description: Faker::Food.description,
		  steps_attributes: steps_params }
	end
end

def recipe_nutrients_params
	Faker::Food.unique.clear
	NUTRIENTS_COUNT.times.map do
		{ quantity: Faker::Number.between(from: 1, to: 999),
		  unit: Faker::Number.between(from: 0, to: 2),
		  nutrient_attributes: { name: Faker::Food.unique.dish } }
	end
end

def user_params # Returns a populated User params hash
	{ username: Faker::Internet.username(specifier: 4..20),
	  email: Faker::Internet.email,
	  password: Faker::Internet.password }
end

def review_params(user)
	# Returns array of populated Review params hashes
	{ user: user,
	  rating: Faker::Number.between(from: 1, to: 5),
	  comment: Faker::Lorem.paragraphs(number: 1) }
end

def tags_params # Returns array of populated Tag params hashes
	Faker::Food.unique.clear
	TAGS_COUNT.times.map do
		{ name: Faker::Food.unique.ethnic_category }
	end
end

def recipe_params # Returns a populated Recipe params hash
	{ title: Faker::Food.dish,
	  cook_time: "#{Faker::Number.between(from: 0, to: 5)}H#{Faker::Number.between(from: 5, to: 55)}M",
	  prep_time: "#{Faker::Number.between(from: 0, to: 5)}H#{Faker::Number.between(from: 5, to: 55)}M",
	  total_time: "#{Faker::Number.between(from: 0, to: 5)}H#{Faker::Number.between(from: 5, to: 55)}M",
	  description: Faker::Food.description,
	  yield: Faker::Food.measurement,
	  sections_attributes: sections_params,
	  recipe_nutrients_attributes: recipe_nutrients_params,
	  tags_attributes: tags_params,
	  recipe_ingredients_attributes: recipe_ingredients_params }
end

# Create Users and Recipes for those users, along with all tags_recipes inside Recipe
USERS_COUNT.times do
	u = User.create!(user_params)
	RECIPES_COUNT.times do
		r = u.recipes.create!(recipe_params)
	end
end

# Create REVIEWS_COUNT Reviews from randomly selected users for each recipe
Recipe.all.each do |recipe|
	users_ids = REVIEWS_COUNT.times.map do
		Faker::Number.unique.between(from: 1, to: USERS_COUNT)
	end
	Faker::Number.unique.clear

	User.find(users_ids).each do |user|
		recipe.reviews.create!(review_params(user))
	end
end

# Create Admin
User.create!(ADMIN_PARAMS)











