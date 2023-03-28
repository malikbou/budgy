class ChangeBudgetInEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :budget
    add_column :events, :budget, :float
  end
end
