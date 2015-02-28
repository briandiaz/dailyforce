Rails.application.routes.draw do
  
  resources :orders  
  resources :cases
  resources :contacts
  resources :accounts
  resources :opportunities
  resources :campaigns
  
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/login'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
  get "auth/salesforce", to: "sessions#create", as: 'signin'
  
  get "login", to: "pages#login", as: "login"
  get "home", to: "pages#home", as: "home"

  root "pages#home"
  
end
