class Event < ApplicationRecord
  belongs_to :user
  has_many :budgets
  has_many :expenses
end
