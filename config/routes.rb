Rails.application.routes.draw do
  resources :videos
  resources :courses
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'courses', to: 'courses#index'
  root to: 'main#index'
end
