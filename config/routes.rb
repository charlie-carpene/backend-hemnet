Rails.application.routes.draw do
  resources :categories, only: :index
  resources :movies, only: [:show, :create]
end
