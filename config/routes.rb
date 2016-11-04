# frozen_string_literal: true
Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get '/users/:id', to: 'profiles#show', as: :profile
  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile
  get '/set_locale/:locale', to: 'application#set_locale', as: :set_locale
  #get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
  get '/change_locale/:locale', to: 'application#change_locale', as: :change_locale
 # get '//change_locale/en', to: 'application#change_locale', as: :change_locale

  root to: 'pages#home'
  get 'product_index', to: 'products#index', as: :product_index
  get 'product_show/:id', to: 'products#show', as: :product_show
  resources :companies
  resources :searches
  resources :templates
  resources :extractions

  end

end
