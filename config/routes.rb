Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "recipes#index"

  resources :recipes
  resources :ingredients
  resources :instructions
  resources :instruction_sections
  resources :nutritions
  resources :recipe_ingredients
  resources :reviews
  resources :tags
  resources :users
  # Devise routes
  devise_for :users





  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
