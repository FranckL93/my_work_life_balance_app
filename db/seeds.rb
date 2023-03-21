# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create users
user1 = User.create(name: "John Doe", email: "johndoe@example.com", password: "password")
user2 = User.create(name: "Jane Doe", email: "janedoe@example.com", password: "password")

# Create communities
community1 = Community.create(name: "Fitness Group", description: "A group for fitness enthusiasts")
community2 = Community.create(name: "Cooking Club", description: "A club for food lovers")

# Create goals
goal1 = Goal.create(title: "Run 5 miles", description: "Run 5 miles without stopping", user: user1)
goal2 = Goal.create(title: "Learn to cook Thai food", description: "Learn to cook pad thai and green curry", user: user2)

# Add users to communities
CommunityMembership.create(user: user1, community: community1)
CommunityMembership.create(user: user2, community: community2)

# Create activities
activity1 = Activity.create(title: "Morning run", description: "Ran 3 miles in the morning", goal: goal1)
activity2 = Activity.create(title: "Groceries", description: "Bought some chicken, nuts and curry", goal: goal2)
