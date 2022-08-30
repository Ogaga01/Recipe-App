# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recipe/index'
  devise_for :users

  root 'home#index'
  resources :recipes, except: [:update]
end
