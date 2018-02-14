Rails.application.routes.draw do
  resources :admins
  resources :art_pieces
  resources :artists
  resources :baristas
  resources :places
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
