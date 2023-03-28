class CreateEventBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :event_budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :events, null: false, foreign_key: true
      t.float :flights
      t.string :accommodation
      t.string :float
      t.float :transport
      t.float :eating_out
      t.float :entertainment
      t.float :activities
      t.float :shopping
      t.float :emergency

      t.timestamps
    end
  end
end
