class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :category
      t.integer :people
      t.date :start_date
      t.date :end_date
      t.boolean :budget
      t.string :currency

      t.timestamps
    end
  end
end
