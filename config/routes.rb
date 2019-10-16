Rails.application.routes.draw do
  resources :recipes
  devise_for :users
  resources :categories
  get 'homes/index'
  get 'homes/categories'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
