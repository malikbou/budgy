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

puts "checking something"
user_id = User.first.id
puts "ID retrieved: #{user_id}"

puts "Creating events..."
lisbon = {user_id: user_id,
  name: "Lisboa",
  description: "The bois in Lisbon",
  category: "Trip",
  people: 5,
  start_date: "2023-01-01",
  end_date: "2023-01-30",
  budget: 1550,
  currency: 'EUR'}
madrid = {user_id: user_id,
  name: "Madrid",
  description: "The bois in Madrid",
  category: "Trip",
  people: 8,
  start_date: "2023-02-14",
  end_date: "2023-02-25",
  budget: 1280,
  currency: 'EUR'}

[lisbon, madrid].each do |attributes|
  event = Event.create!(attributes)
  puts "Created #{event.name}"
end
puts "Finished!"
