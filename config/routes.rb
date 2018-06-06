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
    member do
      get :send_email_contract
      get :send_email_inventory
    end

    resources :renters, only: [:new, :create]
    resources :inventories, only: [:new, :create, :index]
    resources :receipts, only: [:new, :create, :index]

  end
  resources :receipts, only: [:show]
  resources :rooms, only: [:edit, :update]
  get 'profile/edit', to: 'profiles#edit'
  patch 'profile', to: 'profiles#update'
end
