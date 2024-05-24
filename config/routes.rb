Rails.application.routes.draw do
	# Defines the root path route ("/")
	root "static_pages#home", as: 'home'

	# Users
	devise_for :users, path: '', path_names: {
		sign_in: 'login',
		sign_out: 'logout',
		sign_up: 'register'
	}
	resources :users, only: [:show, :edit, :update]

	# Recipes and Reviews for a Recipe
	resources :recipes, shallow: true do
		resources :reviews
	end

	# Tags
	resources :tags, only: [:index] do
		resources :recipes, only: [:index], controller: 'tags/recipes'
	end

	# Ingredients
	resources :ingredients, only: [:index, :show] do
		resources :recipes, only: [:index], controller: 'ingredients/recipes'
	end

	# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
	# Can be used by load balancers and uptime monitors to verify that the app is live.
	get "up" => "rails/health#show", as: :rails_health_check
end
