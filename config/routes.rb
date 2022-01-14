Rails.application.routes.draw do
  resources :videos
  resources :courses
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  get 'update_user', to: 'user#create'
  patch 'update_user', to: 'user#update'

  delete "logout", to:  "sessions#destroy"

  root to: 'main#index'
end
