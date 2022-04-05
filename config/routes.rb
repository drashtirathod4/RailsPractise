Rails.application.routes.draw do
  get 'send_mail', to: 'users#send_mail'

  # breaking large route file into small one using draw()
  draw(:admin) # Will load another route file located in `config/routes/admin.rb`

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

  # unicode characters route
  # get 'こんにちは', to: 'users#welcome'

  # Direct routes : this will direct to rails root path after user login
  # direct :welcome do
  #   "https://rubyonrails.org"
  # end

  # member routes 
  # route: /users/1/profile
  resources :users do
    member do 
      get 'profile'
    end
  end

  # using root
  root 'users#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
