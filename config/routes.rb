Rails.application.routes.draw do
  get "dashboard/index"
  get "home/index"
  resources :books do
    resources :reviews
    member do
     patch :toggle_favorite
    end
  end

  resources :users

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  get "signup", to: "users#new"
  get "/dashboard", to: "dashboard#index", as: "dashboard"
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
