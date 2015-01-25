Rails.application.routes.draw do
  
   get '/map' => 'map#index'
   get '/map/show' => 'map#show'

   get '/' => 'insta#index'
   get '/show'  => 'insta#show'

   resources :favorites
   # get'/favorites/:id' => "favorites#create"
   # post '/favorites/:id' => "favorites#create"
   # get '/favorites' => "favorites#index" 
   # delete '/favorites/:id' => "favorites#destroy"

end
