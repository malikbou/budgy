class EventsController < ApplicationController
  def my_events
    @events = Event.where(user_id: current_user.id)
  end

  def show
    @event = Event.find(params[:id])
    # if today's date is >= to start date and <= end date
      # calculate days left in trip
    # else don't calculate and say trip has not started
    if (Date.today >= @event.start_date) && (Date.today <= @event.end_date)
      @days_left = (@event.end_date - Date.today).to_i
    else
      @days_left = nil
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to my_events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :category, :people,
      :start_date, :end_date, :budget, :currency)
  end
end
