Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "static_pages#home"
  
  # Devise routes
  devise_for :users
  
  # Recipes and Reviews for a Recipe
  resources :recipes, shallow: true do 
    resources :reviews
  end
  
  get 'tags/:tag', to: 'recipes#index', as: :tag
  get 'ingredients/:ingredient', to: 'recipes#index', as: :ingredient

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
