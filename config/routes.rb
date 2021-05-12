Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :collections
  resources :bags
  resources :favourites
  resources :categories
  resources :product_variants
  resources :images
  resources :products
  resources :sessions, only: [:new, :create, :destroy]

  #'get' is for /signup, 'as' is for the view (link_to "Sign Up", signup_path)
  get 'signup', to: 'users#new', as: 'signup'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  #get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
