Rails.application.routes.draw do

  root 'pages#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/login', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"  
  get 'auth/:provider/callback', to: 'sessions#omniauth' 
    
  resources :users, only: [:create]
  resources :projects, except: [:edit, :update, :destroy] do
    resources :features, only: [:create] do
      resources :tasks, only: [:show, :create, :update]
    end
  end
  resources :user_tasks, only: [:index]
  
end
