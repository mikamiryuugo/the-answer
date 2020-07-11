Rails.application.routes.draw do
  get 'users/show'
  get 'post_likes/create'
  get 'post_likes/destroy'
  root 'tops#index'
  resources :posts
  resources :post_likes, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
