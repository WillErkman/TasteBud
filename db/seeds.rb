USERS_COUNT = 10
USERS = []
RECIPES_COUNT = 10
SECTIONS_COUNT = 1
TAGS = %w[Mexican Dinner Lunch Italian]

# Users
USERS_COUNT.times do
	USERS << User.create!(
		username: Faker::Internet.username(specifier: 4..20),
		email: Faker::Internet.email,
		password: Faker::Internet.password
	)
end
# Recipes
