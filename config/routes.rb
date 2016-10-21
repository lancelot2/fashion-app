Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'product_index', to: 'pages#product_index'
  resources :searches
  resources :templates
  resources :extractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
