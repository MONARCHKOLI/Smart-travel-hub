Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  
  root "home#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  unauthenticated do
    root "devise/sessions#new", as: :unauthenticated_root
  end

  resources :food_orders

  resources :food_items
  
  resources :bookings do
    member do
      get :confirm
      get :reject
    end
  end
  
  resources :rooms
  
  resources :motels

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end