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
  post 'products/all/filter', to: 'products#all_filter', as: 'all_filter'
  post 'products/search', to: 'products#search', as: 'search'
  get 'products/:id', to: 'products#show', as: 'products_view'
  get 'products/:id/', to: 'products#add_to_bag
  ', as: 'products_add_to_bag'
  get 'category/new-arrivals', to: 'categories#new_arrivals', as: 'category_new_arrivals_view'
  post 'category/new-arrivals/filter', to: 'categories#new_arrivals_filter', as: 'category_new_arrivals_filter_view'
  get 'category/:id', to: 'categories#display', as: 'category_view'
  post 'category/:id/filter', to: 'categories#display_filter', as: 'category_display_filter'
  get 'saved-list', to: 'favourites#saved_list', as: 'saved_list'
  get 'support', to: 'home#support', as: 'support'
  get 'cart', to: 'bags#cart', as: 'cart'
  get 'gateway', to: 'home#gateway', as: 'gateway'
  get 'profile', to: 'home#profile', as: 'profile'
  get 'subscribe', to: 'home#subscribe', as: 'subscribe'
  get 'unsubscribe', to: 'home#unsubscribe', as: 'unsubscribe'
  get 'edit/login', to: 'users#edit_profile', as: 'edit_login'
  post 'cart/checkout', to: 'bags#checkout', as: 'checkout'
  post 'bags', to: 'bags#create', as: 'bags_create'
  get 'forget-password', to: 'users#forget_password', as: 'forget_password_get'
  post 'forget-password', to: 'users#forget_password', as: 'forget_password_post'
  get '/login/:username/:token', to: 'sessions#login'
  get '/auth/twitter/callback', to: 'sessions#twitter'
  get 'rating', to: 'users#rating', as: 'rating'

  #get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
