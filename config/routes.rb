Rails.application.routes.draw do
  root to: 'home#index'
  resources :companies, only: [:index, :show, :new, :create, :edit, :update]
  resources :vehicles, only: [:index, :new, :create, :edit, :update]
end
