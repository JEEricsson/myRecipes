Rails.application.routes.draw do
    
   root 'pages#home'    
    
  get '/home', to: 'pages#home'
  

  
  resources :recipes do
    member do
      post 'like'
      
    
    end
  
  end
  
  resources :chefs, exept: [:new]
  
  get '/register', to: 'chefs#new'
  
  
end
