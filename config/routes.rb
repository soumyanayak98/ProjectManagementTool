Rails.application.routes.draw do

  root 'pages#index'

    
  resources :users, only: [:create]
  resources :projects
  get '/signup', to: 'users#new'
  
  get '/login', to: "sessions#new"
  post '/login', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"  
  
end
