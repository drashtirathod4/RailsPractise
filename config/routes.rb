Rails.application.routes.draw do
  root "products#index"

  post "checkout/create", to: "checkout#create"
  resources :products
  resources :users
  resources :webhooks, only: [:create]
end
