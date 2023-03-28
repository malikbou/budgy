Rails.application.routes.draw do
  devise_for :users
  root to: "events#my_events"

  resources :events, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :event_budgets, only: [:new, :create, :edit, :update, :show]
  end
  get "my_events", to: "events#my_events", as: :my_events

# event_event_budgets       POST   /events/:event_id/event_budgets(.:format)                     event_budgets#create
# new_event_event_budget    GET    /events/:event_id/event_budgets/new(.:format)                 event_budgets#new
# edit_event_event_budget   GET    /events/:event_id/event_budgets/:id/edit(.:format)            event_budgets#edit
# event_event_budget        GET    /events/:event_id/event_budgets/:id(.:format)                 event_budgets#show
#                           PATCH  /events/:event_id/event_budgets/:id(.:format)                 event_budgets#update
#                           PUT    /events/:event_id/event_budgets/:id(.:format)                 event_budgets#update

end
