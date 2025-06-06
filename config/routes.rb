Rails.application.routes.draw do
  # resources :users do
  #    resources :books
  # end
  resources :books
  resources :users

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # resources :users
  root "users#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
