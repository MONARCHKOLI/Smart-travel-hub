Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  
  authenticated :user do
    root "home#index", as: :authenticated_root
  end

  unauthenticated do
    root "devise/sessions#new", as: :unauthenticated_root
  end

  resources :food_orders
  resources :food_items
  resources :bookings
  resources :rooms
  resources :motels

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end