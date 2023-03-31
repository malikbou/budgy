class Budget < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.all_columns
    column_names.reject { |column| %w[id user_id event_id created_at updated_at].include?(column) }.map do |column_name|
      [Budget.human_attribute_name(column_name), column_name]
    end
  end
end
