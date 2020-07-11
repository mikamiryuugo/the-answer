Rails.application.routes.draw do
  get 'users/show'
  root 'tops#index'
  resources :posts
  resources :post_likes, only: [:create, :destroy, :index]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
