Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :housings do
    resources :rooms, only: [:new, :create]
    resources :rentals, only: [:new, :create]
  end
  resources :rooms, only: [:edit, :update]
end
