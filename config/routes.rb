Rails.application.routes.draw do
  root 'shows#index'
  resources :shows
  post '/shows/search_tmdb'
  get '/shows/search_id/:id', to: 'shows#search_id'
  get '/shows/get_ep/:name/:id/:season/:ep', to: 'shows#get_ep', constraints: { name: /[0-9A-Za-z\-\.]+/ }
  get '/shows/get_ep_info/:name/:id/:season/:ep', to: 'shows#get_ep_info'
end
