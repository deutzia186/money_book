Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "books#index"
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:index, :new, :create, :edit, :update, :destroy] do
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :lists, only: [:index] do
    collection do
      get :search
    end
  end

end
