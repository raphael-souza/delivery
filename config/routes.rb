Rails.application.routes.draw do
  resources :deliverymen
  resources :vehicles
  resources :addresses
  resources :cities
  resources :states
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
