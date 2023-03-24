class EventsController < ApplicationController
  def my_events
    @events = Event.where(user_id: current_user.id)
  end
end
