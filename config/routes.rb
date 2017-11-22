Rails.application.routes.draw do
  resources :users
  resources :families do
    resources :people
    resources :submittals do 
      get '/approve' => 'submittals#approve', :as => 'approve_submittal'
      get 'revoke' => 'submittals#revoke', :as => 'revoke_submittal'
    end
  end

  # get '/families/:family_id/submittals/:id/approve' => 'submittals#approve', :as => 'approve_submittal'
  # get '/families/:family_id/submittals/:id/revoke' => 'submittals#revoke', :as => 'revoke_submittal'
  
  # Entry point, login and logout.
  get '/home' => 'home#index', :as => 'home'
  post '/home/login' => 'home#login', :as => 'login'
  get '/home/logout' => 'home#logout', :as => 'logout'
  get '/dashboard' => 'home#dash', :as => 'dash'
  root :to => redirect('/home')
end
