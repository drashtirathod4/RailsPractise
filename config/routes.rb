class ExcludedSubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && !Apartment::Elevators::Subdomain.excluded_subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  constraints ExcludedSubdomainConstraint do
    resources :projects
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
