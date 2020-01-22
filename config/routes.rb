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
  end
end
