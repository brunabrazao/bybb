Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :reports
  get 'users/sign_up', to: 'homepage#index'

  devise_for :users, controllers: { invitations: 'invitations' }

  scope '/admin' do
    resources :users
    resources :organisations
    resources :roles
  end
  root 'homepage#index'
  get 'how-it-works', to: 'homepage#how_it_works'
  get 'dashboard', to: 'dashboards#index'
end
