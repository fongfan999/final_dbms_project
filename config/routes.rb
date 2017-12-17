Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  namespace :admin do
    root 'flights#index'
    resources :flights do
      resources :tickets, only: %i(show edit update destroy)
    end

    resources :tickets, only: :index
  end

  resources :bookings, only: :create
end
