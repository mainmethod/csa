Rails.application.routes.draw do
  root 'sessions#new'
  resources :organizations
  resources :sessions
  resources :users
  
  get 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout, via: [:get, :post]
end
