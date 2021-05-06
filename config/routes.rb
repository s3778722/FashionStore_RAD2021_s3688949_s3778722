Rails.application.routes.draw do
  resources :bags
  resources :saved_lists
  resources :users
  resources :categories
  resources :product_variants
  resources :images
  resources :products
  #get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
