Rails.application.routes.draw do
  root to: "dashboard#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  namespace :admin do
    resources :categories
    resources :products
  end
  resources :carts, only: [:index]
  resources :products, only: [:index, :show]
  resources :order_items, only: [:create, :update, :destroy]
  get 'orders/checkout'
  post 'orders/update_order_details'
end
