Rails.application.routes.draw do
  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  devise_for :users
  root "books#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :new, :create, :edit, :update, :destroy] do
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :lists, only: [:index] do
    collection do
      get :search
    end
  end
end
