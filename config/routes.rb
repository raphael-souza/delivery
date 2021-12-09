Rails.application.routes.draw do
  resources :businesses
  resources :shippings
  resources :orders
  resources :clients
  resources :managers
  resources :merchants
  resources :deliverymen
  resources :vehicles
  resources :addresses
  resources :cities
  resources :states
  resources :users
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
