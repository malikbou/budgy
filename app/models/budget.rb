class Budget < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.all_columns
    column_names.reject { |column| %w[id user_id event_id created_at updated_at].include?(column) }.each_with_object([]) do |column_name, columns|
      columns << [Budget.human_attribute_name(column_name), column_name]
    end
  end

  def emoji
    case category
    when "accommodation" then "🏠"
    when "flights" then "🛩️"
    when "eating_out" then "🍔"
    when "entertainment" then "🎭"
    when "activities" then "🏄‍♂️"
    when "shopping" then "🛍️"
    when "emergency" then "🚨"
    end
  end
end
