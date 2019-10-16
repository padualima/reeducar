Rails.application.routes.draw do
  resources :recipes
  devise_for :users
  resources :categories
  root 'homes#index'
  get 'homes/categories'
  get 'homes/search', to: "homes#search"
  get 'homes/comments', to: "homes#comments"
end
