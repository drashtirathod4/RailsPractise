Rails.application.routes.draw do
  post '/create_user', to: 'users#create_user'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
