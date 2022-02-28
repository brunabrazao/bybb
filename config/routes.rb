Rails.application.routes.draw do
  resources :reports
  devise_for :users, controllers: { invitations: 'invitations' }

  scope '/admin' do
    resources :users
    resources :organisations
    resources :roles
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'homepage#index'
  get 'how-it-works', to: 'homepage#how_it_works'
end
