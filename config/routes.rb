Rails.application.routes.draw do
  resources :videos
  resources :courses
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  root to: 'main#index'
end
