Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :new, :create]
  resources :lists, only: [:index]
end 
