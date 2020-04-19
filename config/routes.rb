Rails.application.routes.draw do
  root to: "pages#index"
  get "/contact-us", to: "pages#contact", as: "contact"
  get "/schedule", to: "pages#schedule"
  get "/results", to: "pages#results"

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", confirmations: "users/confirmations" }

  resources :users
  resources :players, only: %i[index new create show edit update]
  resources :teams
  resources :divisions
  resources :contact_forms, only: %i[index new create]
  resources :blog, only: %i[show index]

  namespace :admin_center do
    root to: "dashboard#index"

    resources :dashboard, only: [:index]
    resources :teams do
      patch :add_player
    end
    resources :players
    resources :matches
  end
end
