# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources  :foods 
  resources :recipes
  resources :recipe_foods

end
