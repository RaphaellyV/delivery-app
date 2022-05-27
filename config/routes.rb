Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :companies, only: [:index, :show, :new, :create, :edit, :update]
  resources :vehicles, only: [:index, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :edit, :update]
  resources :deadlines, only: [:index, :new, :create, :edit, :update]
end
