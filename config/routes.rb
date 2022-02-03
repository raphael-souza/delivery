Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users, :orders, :collects
  end

  resources :rooms, only: [:index, :create]
  mount ActionCable.server => '/cable'
  
  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end