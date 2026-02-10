Rails.application.routes.draw do
  # Login
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Profile
  get "profile/edit", to: "profiles#edit", as: :edit_profile
  patch "profile", to: "profiles#update", as: :profile

  # Root
  root "sessions#new"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
