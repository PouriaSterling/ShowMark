Rails.application.routes.draw do
  root 'shows#index'
  resources :shows
  post '/shows/search_tmdb'
  get '/shows/search_id/:id', to: 'shows#search_id'
end
  