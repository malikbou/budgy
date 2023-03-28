class RenameEventsBudgetToBudget < ActiveRecord::Migration[7.0]
  def change
    rename_table :event_budgets, :budgets
  end
end
