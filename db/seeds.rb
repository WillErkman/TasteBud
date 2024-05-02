#  Resource Sizes and Special Resources
USERS_COUNT = 10 # Number of Users
RECIPES_COUNT = 5 # Number of Recipes per User
SECTIONS_COUNT = 1 # Number of Sections/Procedures/IngredientLists per Recipe
INGREDIENT_COUNT = 8 # Number of Ingredients per Recipe/Section/IngredientList
TAGS_COUNT = 3 # Number of Tags per Recipe
REVIEWS_COUNT = 4 # Number of Reviews per Recipe
ADMIN_PARAMS = { username: "Admin", email: "admin@admin.com", password: "admin1", admin: true } # Administrator info

#  Parameter creation methods
def ingredient_lists_params # Returns array of populated IngredientList params hashes
	INGREDIENT_COUNT.times.map do |i|
		{ quantity: Faker::Food.measurement,
		  ingredient: Ingredient.find_or_create_by(name: Faker::Food.ingredient) }
	end
end

def procedure_params # Returns a populated Procedure params hash
	{ content: Faker::Lorem.paragraphs(number: 4) }
end

def sections_params # Returns array of populated Section params hashes
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

def get_tags # Returns array of populated Tag params hashes
	Faker::Food.unique.clear
	TAGS_COUNT.times.map do
		Tag.find_or_create_by(name: Faker::Food.unique.ethnic_category)
	end
end

# Create Users and Recipes for those users, along with all resources inside Recipe
USERS_COUNT.times do
	u = User.create!(user_params)
	RECIPES_COUNT.times do
		r = u.recipes.create!(recipe_params)
		r.tags << get_tags
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









