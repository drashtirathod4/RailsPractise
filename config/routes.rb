Rails.application.routes.draw do
  devise_for :jwt_users,
    controllers: {
      sessions: 'jwt_users/sessions',
      registrations: 'jwt_users/registrations'
  }
  get '/member-data', to: 'members#show'

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
