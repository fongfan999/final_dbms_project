Rails.application.routes.draw do
  resources :flights do
    resources :tickets, except: [:new, :create]
  end

  root 'welcome#index'

  devise_for :users
end
