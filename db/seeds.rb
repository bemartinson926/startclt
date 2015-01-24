# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
require 'active_support'

# you = User.find_by(email: "test@example.com") || User.create(email: "test@example.com", password: "password")
# mat = User.find_by(email: "matbanbury@gmail.com") || User.create(email: "matbanbury@gmail.com", password: "password")

# # Create 5 mat groups 

# 5.times do |i|
#   g = Group.create(name: Faker::Company.name,
#                    description: Faker::Hacker.say_something_smart)
#   puts "Created #{g.name}"
#   10.times do |e|
#     starts_at = (rand(14)-7).days.from_now
#     ends_at = 1.5.hours.from_now(starts_at)
#     ev = Event.create(name: Faker::Lorem.words(5).join(" "), 
#                       group: g,
#                       description: Faker::Hacker.say_something_smart,
#                       location: Faker::Address.street_address,
#                       starts_at: starts_at,
#                       ends_at: ends_at
#                       )
#     puts "Created event #{ev.name}"
#   end
#   if rand(2) == 0
#     you.groups << g 
#     puts "Added you to #{g.name}"
#   end
# end