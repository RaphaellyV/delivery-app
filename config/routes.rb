Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :companies, only: [:index, :show, :new, :create, :edit, :update]
  resources :vehicles, only: [:index, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :edit, :update]
  resources :deadlines, only: [:index, :new, :create, :edit, :update]
  resources :quotations, only: [:index, :new, :create, :show]

  resources :orders, only: [:new, :create, :show] do
    get 'search', on: :collection
    post 'accepted', on: :member
    post 'refused', on: :member
    post 'delivered', on: :member
  end
end
