# frozen_string_literal: true
Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope '(:locale)', locale: /fr|en/ do
    devise_for :users

    get '/users/:id', to: 'profiles#show', as: :profile
    get '/profile/edit', to: 'profiles#edit', as: :edit_profile
    patch '/profile', to: 'profiles#update', as: :update_profile

    root to: 'pages#home'

    get 'apphome', to: 'pages#apphome', as: :apphome
    get 'contacts', to: 'pages#contacts', as: :contacts
    get 'accesses', to: 'pages#accesses', as: :accesses
    get ':id/profile/validate', to: 'profiles#validate', as: :validate
    get ':id/profile/freeze', to: 'profiles#freeze', as: :freeze
    get ':id/profile/downgrade', to: 'profiles#downgrade', as: :downgrade
    get ':id/profile/upgrade', to: 'profiles#upgrade', as: :upgrade
    get ':id/profile/destroy', to: 'profiles#destroy', as: :destroy

    get 'product_index', to: 'products#index', as: :product_index
    get 'product_export', to: 'products#export', as: :product_export
    get 'product_show/:id', to: 'products#show', as: :product_show

    resources :companies, only: [:index, :new, :create]
    resources :searches, only: [:index, :create, :edit, :update]
    resources :templates, only: [:index, :new, :create]
    resources :extractions, only: [:index, :new, :create]
  end
end
