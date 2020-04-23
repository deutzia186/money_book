Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :lists, only: [:index] do
    collection do
      get :search
    end
  end
end
