Rails.application.routes.draw do
  get 'public_recipes/index'
  # get 'recipe/index'
  get 'shopping_lists/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  resources :recipes do
    resources :recipe_foods
  end

  resources :users do
    resources :recipes
    resources :foods
  end

  resources :foods do
    resources :reipe_foods
  end

  get '/public_recipes/index', to: 'public_recipes#index', as: :public_recipes
  get '/shopping_lists/index', to: 'shopping_lists#index', as: :shopping_lists
end