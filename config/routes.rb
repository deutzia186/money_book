Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :users, only: [:edit, :update]
  resources :books, only: [:new, :create, :edit, :update] do
  end
end
