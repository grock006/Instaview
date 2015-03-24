Rails.application.routes.draw do
  root "map#index"
  
  get '/map' => 'map#index'
  get '/map/show' => 'map#show'

  get "/oauth/connect" => "sessions#connect"
  post "/oauth/connect" => "sessions#connect"
  get "/oauth/callback" => "sessions#callback"

  get '/like/:id' => 'favorites#like'
  get '/unlike/:id' => 'favorites#unlike'

  get '/signup' => 'users#new', as: :signup
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  get '/about' => 'application#index', as: :about

  resources :users

  resources :favorites


end
