Rails.application.routes.draw do
  resources :users
  resources :families
  resources :people
  
  # home doesn't reqiure full resources.
  get '/home' => 'homes#index', :as => 'home'
  
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/home')
end
