require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'
  namespace :api, defaults: { format: :json } do
    resources :users
    resources :collects
    resources :deliverymen
    resources :orders do 
      collection do
        post :request_withdrawal
      end
    end
  end

  namespace :bot do
    resources :messages do 
      collection do
        post :bot, defaults: {format: :xml }
      end
    end
  end
  
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
