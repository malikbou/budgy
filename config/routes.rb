Rails.application.routes.draw do
  devise_for :users
  root to: "events#my_events"

  resources :events, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :budgets, only: [:new, :create, :edit, :update, :show, :destroy]
  end
  get "my_events", to: "events#my_events", as: :my_events

end
