# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope '(:locale)', locale: /fr|es/ do
    get '/users/:id', to: 'profiles#show', as: :profile
    get '/profile/edit', to: 'profiles#edit', as: :edit_profile
    patch '/profile', to: 'profiles#update', as: :update_profile

    root to: 'pages#home'
    get 'home2', to: 'pages#home2', as: :home2
    get 'product_index', to: 'products#index', as: :product_index
    get 'product_show/:id', to: 'products#show', as: :product_show
    resources :companies
    resources :searches
    resources :templates
    resources :extractions
  end
end
