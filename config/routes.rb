Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :system_events, only: :index
  resources :from_hosts, only: :index
  resource :user, only: %i[show update]

  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#logout'
  resource :sessions, only: %i[create]

  root to: 'system_events#index'
end
