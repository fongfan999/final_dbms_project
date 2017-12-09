Rails.application.routes.draw do
  resources :tickets
  root 'welcome#index'
end
