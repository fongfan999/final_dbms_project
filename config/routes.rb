Rails.application.routes.draw do
  resources :tickets
  root 'welcome#index'

  devise_for :users
end
