Rails.application.routes.draw do
  resources :users do
    delete :delete_attachement, on: :member
    delete :delete_post_attachement, on: :member
  end
  # delete '/users/:id/delete_attachement/:post_id', controller: :delete_post_attachement, action: :delete
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
