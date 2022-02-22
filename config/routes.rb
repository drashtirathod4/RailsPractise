Rails.application.routes.draw do
  # nested resources and shallow nesting 
  # route : /sekret/ads/1
  scope shallow_path: "sekret" do
    resources :magazines do
      resources :ads, shallow: true
    end
  end

  # route using namespace will be: /admin/articles
  # namespace :admin do
  #   resources :articles, only: [:index, :new, :create]
  # end

  # route using scope will be: /articles
  scope module: 'admin' do
    resources :articles, only: [:index, :new, :create]
  end

  # Non resourceful routes

  # Naming route
  delete 'exit' => 'sessions#destroy', as: :logout
  post 'login' => 'sessions#create'
  get 'sessions/new'
  get '/login' => 'sessions#new'

  get 'signup'  => 'users#new'
  get 'welcome'  => 'users#welcome'

  # member routes 
  # route: /users/1/profile
  resources :users do
    member do 
      get 'profile'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
