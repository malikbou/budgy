class EventBudget < ApplicationRecord
  belongs_to :user
  belongs_to :events
end
