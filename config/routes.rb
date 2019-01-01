Rails.application.routes.draw do
  resources :quotes
  resources :events
  resources :event_images
  devise_for :admins
  resources :admins

  resources :artists do
    resources :art_pieces
  end
  resources :baristas do
    resources :barista_photos
  end
  resources :places do
    resources :place_photos
  end
  root to: 'places#show', :id => 1

  get "current_art/index"
  match('current_art/' => 'current_art#index', :via => :get)
  match('current_art/labels' => 'current_art#labels', :via => :get)

  get "admin/index"
  match('admin/' => 'admin#index', :via => :get)
  match('admin/approve_admins' => 'admin#approve_admins', :via => :post)
  match('admin/approve_admins' => 'admin#approve_admins', :via => :get, as: 'approve_admins')
  match('admin/denied' => 'admin#denied', :via => :get)


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
