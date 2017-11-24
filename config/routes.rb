Rails.application.routes.draw do
  
  resources :users do 
    resources :tasks
  end

  resources :families do
    resources :people
    resources :submittals
  end
  
  # Entry point, login and logout.
  get '/home' => 'home#index', :as => 'home'
  post '/home/login' => 'home#login', :as => 'login'
  get '/home/logout' => 'home#logout', :as => 'logout'
  get '/dashboard' => 'home#dash', :as => 'dash'
  root :to => redirect('/home')
end
