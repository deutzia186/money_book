Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :users, only: [:index, :edit, :show, :update]
  resources :users, only: [:index, :edit, :update]
  resources :lists, only: [:index]
end 
