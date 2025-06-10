Rails.application.routes.draw do
  get "home/index"
  resources :books do
     resources :reviews
  end

  resources :users

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "users#new"
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
