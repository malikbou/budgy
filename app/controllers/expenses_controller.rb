class ExpensesController < ApplicationController
before_action :set_event, only: %i[new create edit destroy update]

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.event = @event
    @expense.user = current_user
    if @expense.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    redirect_to event_path(@event)
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to event_path(@event), status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def expense_params
    params.require(:expense).permit(:description, :participants, :amount, :category)
  end
end
