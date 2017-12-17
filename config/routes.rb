Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  namespace :admin do
    resources :flights do
      resources :tickets, except: [:new, :create]
    end
  end
end
