Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :users
  resources :books, only:[:index, :create, :show, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
end