require 'sidekiq/web'

Rails.application.routes.draw do
  get '/generate_random_user', to: 'users#generate_random_user'

  mount Sidekiq::Web => '/sidekiq'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
