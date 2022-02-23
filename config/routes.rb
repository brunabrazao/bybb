Rails.application.routes.draw do
  resources :roles
  resources :organisations
  resources :reports
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'homepage#index'
  get 'how-it-works', to: 'homepage#how_it_works'
end
