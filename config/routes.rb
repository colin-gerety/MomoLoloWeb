Rails.application.routes.draw do
  resources :place_photos
  resources :barista_photos
  resources :admins
  resources :art_pieces
  resources :artists
  resources :baristas
  resources :places
  resources :images
  root to: 'places#show', :id => 1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
