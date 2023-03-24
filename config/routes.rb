Rails.application.routes.draw do
  devise_for :users
  root to: "events#my_events"

  resources :events, only: [:show, :new, :create, :edit, :update, :destroy]
  get "my_events", to: "events#my_events", as: :my_events

end
