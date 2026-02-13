Rails.application.routes.draw do
  # Login
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Dashboard
  get "dashboard", to: "dashboard#index", as: :dashboard

  # Profile
  get "profile/edit", to: "profiles#edit", as: :edit_profile
  patch "profile", to: "profiles#update", as: :profile

  # Force password change
  get "password/change", to: "password_changes#edit", as: :force_password_change
  patch "password/change", to: "password_changes#update"

  # User management (admin only)
  resources :users, only: [ :index, :new, :create ]

  # Clients
  resources :clients, only: [ :index, :new, :create, :edit, :update ]

  # Root
  root "sessions#new"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
