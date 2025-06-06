Rails.application.routes.draw do
  root "users#index"

  resources :users
  resources :books

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
end
