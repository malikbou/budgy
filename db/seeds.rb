puts "Cleaning database..."

Event.destroy_all
puts "Destroyed events"

User.destroy_all
puts "Destroyed users"
puts "\n"

puts "Creating users..."
user1 = {
  email: "admin@admin.com",
  password: "adminadmin",
  first_name: "Admin",
  last_name: "Adminton"
}
user2 = {
  email: "malik@bouaoudia.com",
  password: "malikmalik",
  first_name: "Malik",
  last_name: "Bouaoudia"
}
[user1, user2].each do |attributes|
  user = User.create!(attributes)
  puts "\tCreated #{user.first_name} with email: #{user.email}"
end
puts "Finished users!"
puts "\n"

puts "Finding first user ID..."
user_id = User.first.id
puts "First user ID is #{user_id}"
puts "\n"

puts "Creating events..."
lisbon = {
  user_id: user_id,
  name: "Lisboa",
  description: "The bois in Lisbon",
  category: "Trip",
  people: 5,
  start_date: "2023-01-01",
  end_date: "2023-01-30",
  budget: 1550,
  currency: 'EUR'
}

madrid = {
  user_id: user_id,
  name: "Madrid",
  description: "The bois in Madrid",
  category: "Trip",
  people: 8,
  start_date: "2023-02-14",
  end_date: "2023-02-25",
  budget: 1280,
  currency: 'EUR'
}

[lisbon, madrid].each do |attributes|
  event = Event.create!(attributes)
  puts "Created #{event.name}"
end
puts "Finished creating events!"
puts "\n"

puts "Finding first event ID..."
event_id = Event.first.id
puts "First event ID is #{event_id}"
puts "\n"

puts "Creating budgets..."
lisbon_budget = {
  user_id: user_id,
  event_id: event_id,
  flights: 550,
  accommodation: 400,
  transport: 150,
  eating_out: 200,
  entertainment: 250,
  activities: 100,
  shopping: 280,
  emergency: 100
}

[lisbon_budget].each do |attributes|
  budget = Budget.create!(attributes)
  puts "Created Budget for #{budget.event.name}"
end
puts "Finished creating budgets!"
puts "\n"

puts "Adding expenses..."
expenses = []

10.times do
  expenses << {
    user_id: user_id,
    event_id: event_id,
    description: "Random",
    participants: "Malik",
    amount: rand(20..200),
    category: Budget.all_columns.sample.last,
    date: DateTime.now - (rand * 7)           # get random date in last 7 days
  }
end
expenses.each do |attributes|
  expense = Expense.create!(attributes)
  puts "Added #{expense.amount} at #{expense.description} in #{expense.event.name}"
end
puts "Finished adding expenses!"
puts "\n"
