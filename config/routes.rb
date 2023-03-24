Rails.application.routes.draw do
  devise_for :users
  root to: "events#my_events"

  get "my_events", to: "events#my_events", as: :my_events
  get "events/new", to: "events#new"
  post "events", to: "events#create"

  get "events/:id", to: "events#show", as: :event


  get "events/:id/edit", to: "events#edit", as: :edit_event
  patch "events/:id", to: "events#update"

  delete "events/:id", to: "events#destroy"
end
