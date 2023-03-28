class AddReferenceToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :event_budgets, :events_id
    add_reference :event_budgets, :event, index: true
  end
end
