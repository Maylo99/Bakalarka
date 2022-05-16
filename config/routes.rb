Rails.application.routes.draw do
  resources :take_answers, :except => :new
  get 'do_test', to: 'take_test#new'
  get 'my_tests', to: 'take_tests#show_my_tests'
  resources :take_tests
  resources :choices
  resources :multiple_choice_questions
  resources :open_questions
  resources :tests
  resources :videos do
    resources :comentars, only: [:create, :destroy, :edit]
    put 'comentars/:id/edit', to: 'comentars#update'
  end
  resources :courses
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete "logout", to: "sessions#destroy"

  get 'update_user', to: 'user#create'
  patch 'update_user', to: 'user#update'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'index/roles', to: 'admin#index'

  root to: 'main#index'
end
