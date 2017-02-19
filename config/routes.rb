Rails.application.routes.draw do
  resources :users
  resources :locales, only: :index
end
