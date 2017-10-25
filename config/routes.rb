Rails.application.routes.draw do
  resources :users
  resources :families
  resources :people
  # map '/' to be a redirect to '/movies'
  root :to => "users#index"
end
