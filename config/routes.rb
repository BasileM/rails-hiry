Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :housings do
    resources :rooms, only: [:new, :create]
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:show] do
    resources :renters, only: [:new, :create]
    resources :inventories, only: [:new, :create]
    resources :receipts, only: [:new, :create, :index]

  end
  resources :receipts, only: [:show]
  resources :rooms, only: [:edit, :update]
    # resources :inventories, only: [:new, :create]
  # end
end
