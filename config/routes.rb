# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users

  get '/users/:id', to: 'profiles#show', as: :profile
  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile

  root to: 'pages#home'
  get 'product_index', to: 'pages#product_index'
  get 'product_show', to: 'pages#product_show'
  resources :companies
  resources :searches
  resources :templates
  resources :extractions
end
