class ChangeAccomodationToFloat < ActiveRecord::Migration[7.0]
  def change
    remove_column :event_budgets, :float
    remove_column :event_budgets, :accommodation
    add_column :event_budgets, :accommodation, :float
  end
end
