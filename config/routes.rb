Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "static_pages#home"
  
  # Devise routes
  devise_for :users
  
  # Define concern for displaying articales by
  concern :categorizable do
    resources :recipes, only: :index
  end

  # Recipes
  resources :recipes, shallow: true do
    resources :reviews
  end

  # Ingredients
  resources :ingredients, concerns: :categorizable
  
  # Tags
  resources :tags, concerns: :categorizable

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
