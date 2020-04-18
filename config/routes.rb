Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :new, :create, :edit, :update]
  resources :lists, only: [:index]
end 
