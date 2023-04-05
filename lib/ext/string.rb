class String
  def emoji
    case self
      when "accommodation" then "🏠"
      when "flights" then "🛩️"
      when "eating_out" then "🍔"
      when "entertainment" then "🎭"
      when "activities" then "🏄‍♂️"
      when "shopping" then "🛍️"
      when "emergency" then "🚨"
      when "transport" then "🚗"
    end
  end
end
