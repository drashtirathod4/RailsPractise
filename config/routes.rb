Rails.application.routes.draw do
  delete 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'
  get 'sessions/new'
  get '/login' => 'sessions#new'

  get 'signup'  => 'users#new'
  get 'welcome'  => 'users#welcome'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
