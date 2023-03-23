# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# puts "Cleaning database..."
# User.destroy_all
# Community.destroy_all
# Goal.destroy_all
# CommunityMembership.destroy_all
# Activity.destroy_all

# puts 'Creating users...'
# user1 = User.new(name: "John Doe", email: "johndoe@example.com", password: "password")
# user1.save!
# user2 = User.new(name: "Jane Doe", email: "janedoe@example.com", password: "password")
# user2.save!


# puts 'Creating communities...'
# community1 = Community.create!(name: "Fitness Group", description: "A group for fitness enthusiasts")
# community2 = Community.create!(name: "Cooking Club", description: "A club for food lovers")

# puts 'Creating goals...'
# goal1 = user1.goals.create!(name: "Run 5 miles", description: "Run 5 miles without stopping")
# goal2 = user2.goals.create!(name: "Learn to cook Thai food", description: "Learn to cook pad thai and green curry")

# puts 'Adding users to communities...'
# community1.community_memberships.create!(user: user1)
# community2.community_memberships.create!(user: user2)

# puts 'Creating activities...'
# activity1 = goal1.activities.create!(name: "Morning run", description: "Ran 3 miles in the morning")
# activity2 = goal2.activities.create!(name: "Groceries", description: "Bought some chicken, nuts and curry")

# puts 'Finished!'
ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = OFF")

puts "Cleaning database..."
User.destroy_all
Community.destroy_all
Goal.destroy_all
CommunityMembership.destroy_all
Activity.destroy_all

puts 'Creating users...'

user1 = User.create!(name: "John Doe", email: "johndoe@example.com", password_digest: "password")
puts "User1 created with ID: #{user1.id}"
user2 = User.create!(name: "Jane Doe", email: "janedoe@example.com", password_digest: "password")
puts "User2 created with ID: #{user2.id}"

puts 'Creating communities...'
community1 = Community.create!(name: "Fitness Group", description: "A group for fitness enthusiasts", user: user1)

puts "Community1 created with ID: #{community1.id}"
community2 = Community.create!(name: "Cooking Club", description: "A club for food lovers", user: user2)

puts "Community2 created with ID: #{community2.id}"

puts 'Creating goals...'
goal1 = Goal.create!(
  name: "Run 5 miles",
  description: "Run 5 miles without stopping",
  user: user1,
  deadline: Date.new(2023, 6, 30),
  status: "In progress"
)

goal2 = Goal.create!(
  name: "Learn to cook Thai food",
  description: "Learn to cook pad thai and green curry",
  user: user2,
  deadline: Date.new(2023, 4, 30),
  status: "Not started"
)

puts "Goal2 created with ID: #{goal2.id} and user ID: #{goal2.user.id}"

puts 'Adding users to communities...'
CommunityMembership.create!(user: user1, community: community1)
CommunityMembership.create!(user: user2, community: community2)

puts 'Creating activities...'
activity1 = Activity.create!(name: "Morning run", description: "Ran 3 miles in the morning", goal: goal1)

puts "Activity1 created with ID: #{activity1.id} and goal ID: #{activity1.goal.id}"
activity2 = Activity.create!(name: "Groceries", description: "Bought some chicken, nuts and curry", goal: goal2)

puts "Activity2 created with ID: #{activity2.id} and goal ID: #{activity2.goal.id}"

puts 'Finished!'

ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON")
