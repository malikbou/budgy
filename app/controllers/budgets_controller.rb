class BudgetsController < ApplicationController
  before_action :set_event, only: %i[new create]

  def new
    @event = Event.find(params[:event_id])
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.event = @event
    @budget.user = current_user
    if @budget.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def budget_params
    params.require(:budget).permit(:flights, :accommodation, :transport,
    :eating_out, :entertainment, :activities, :shopping, :emergency)
  end
end