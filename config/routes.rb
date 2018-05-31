Rails.application.routes.draw do
  devise_for :users
   authenticated :user do
    root 'housings#index', as: :authenticated_root
  end
  root "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :housings do
    resources :rooms, only: [:new, :create]
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:show] do
    resources :renters, only: [:new, :create]
    resources :inventories, only: [:new, :create]
    resources :receipts, only: [:new, :create]

  end
  resources :receipts, only: [:show, :index]
  resources :rooms, only: [:edit, :update]
    # resources :inventories, only: [:new, :create]
  # end
end
