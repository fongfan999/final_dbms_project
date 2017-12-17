Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  namespace :admin do
    resources :flights do
      resources :tickets, only: %i(show edit update destroy)
    end

    resources :tickets, only: :index
  end
end
