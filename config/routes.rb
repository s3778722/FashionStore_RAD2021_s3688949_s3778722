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
  #default "/products" url is only accesible on admin/products
  resources :products,:path => '/admin/products'
  resources :sessions, only: [:new, :create, :destroy]

  #'get' is for /signup, 'as' is for the view (link_to "Sign Up", signup_path)
  get 'signup', to: 'users#new', as: 'signup'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'products/popular', to: 'products#popular', as: 'popular'
  get 'products/all', to: 'products#all', as: 'all'
  get 'products/:id', to: 'products#show', as: 'products_view'
  get 'category/:id', to: 'categories#display', as: 'category_view'
  get 'saved-list', to: 'favourites#saved_list', as: 'saved_list'
  get 'support', to: 'home#support', as: 'support'
  get 'cart', to: 'bags#cart', as: 'cart'
  get 'gateway', to: 'home#gateway', as: 'gateway'
  get 'profile', to: 'home#profile', as: 'profile'
  post 'cart/checkout', to: 'bags#checkout', as: 'checkout'

  #get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
