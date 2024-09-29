Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users, controllers: {
        sessions: "users/sessions"
      }

  # Static pages routes
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"

  # User profile and relationships routes
  resources :users, only: [ :index, :show, :edit, :update, :destroy ] do
    member do
      get :following, :followers
    end
  end

  # Microposts and relationships routes
  resources :microposts, only: [ :create, :destroy ]
  resources :relationships, only: [ :create, :destroy ]

  # Redirecting "/microposts" to home
  get "/microposts", to: "static_pages#home"
end

