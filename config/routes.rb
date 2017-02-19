Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :locales, only: :index
end
