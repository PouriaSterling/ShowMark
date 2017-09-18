Rails.application.routes.draw do
  # root 'shows#index'
  root 'sessions#index'
  resources :shows
  post '/shows/search_tmdb'
  get '/shows/search_id/:id', to: 'shows#search_id'
  get '/shows/get_ep/:id/:season/:ep', to: 'shows#get_ep'
  get '/shows/get_ep_info/:id/:season/:ep', to: 'shows#get_ep_info'
  get '/about', to: 'shows#about'
  
  
  get  'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/facebook', :as => 'login'
  
end
