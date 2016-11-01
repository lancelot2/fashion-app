# frozen_string_literal: true
Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get '/users/:id', to: 'profiles#show', as: :profile
  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile

  root to: 'pages#home'
  get 'product_index', to: 'products#index', as: :product_index
  get 'product_show/:id', to: 'products#show', as: :product_show
  resources :companies
  resources :searches
  resources :templates
  resources :extractions
end
