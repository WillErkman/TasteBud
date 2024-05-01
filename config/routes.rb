Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "static_pages#home"
  
  # Define concern for displaying articales by
  concern :categorizable do
    resources :recipes, only: :index
  end

  # Recipes
  resources :recipes, shallow: true do
    resources :recipe_ingredients       # Ingredients for a Recipe
    resources :instruction_sections     # Instruction_Sections/Instructions for a Recipe
    resources :nutritions               # Nutrition info for a Recipe
    resources :reviews                  # Reviews for a Recipe
  end

  # Ingredients
  resources :ingredients, concerns: :categorizable
  
  # Tags
  resources :tags, concerns: :categorizable

  # Devise routes
  devise_for :users





  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
