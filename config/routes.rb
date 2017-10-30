Rails.application.routes.draw do
  resources :users
  
  get '/dashboard' => 'users#dash', :as => 'dash'
  get '/user/home' => 'users#home', :as => 'user_home'

  # users must support login functionality
  post '/users/login' => 'users#login', :as => 'login_user'
  get '/logout' => 'users#logout', :as => 'logout_user'
  
  resources :families
  resources :people
  
  # home doesn't reqiure full resources
  get '/home' => 'homes#index', :as => 'home'
  
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/home')
end
