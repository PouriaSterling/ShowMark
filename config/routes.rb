Rails.application.routes.draw do
  root 'shows#index'
  resources :shows
  post '/shows/search_tmdb'
end
  