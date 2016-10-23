Rails.application.routes.draw do
  devise_for :users

  get "/users/:id", to: "profiles#show", as: :profile
  get "/profile/edit", to: "profiles#edit", as: :edit_profile
  patch "/profile", to: "profiles#update", as: :update_profile


  root to: 'pages#home'
  get 'product_index', to: 'pages#product_index'
  resources :searches
  resources :templates
  resources :extractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
