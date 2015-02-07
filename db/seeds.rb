# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

mat = User.find_by(email: "matbanbury@gmail.com") || 
        User.create(email: "matbanbury@gmail.com", 
                     password: "password",
                     first_name: "Mat",
                     last_name: "Banbury",
                     city: "Charlotte",
                     state: "NC",
                     bio: "This is my bio.",
                     phone_number: "980.339.0880"
                     )

# Create 5 groups 

5.times do
  g = Group.create(name: Faker::Company.name,
                   description: Faker::Hacker.say_something_smart
                   )
  puts "Created #{g.name}"

  10.times do
    starts_at = (rand(14)-7).days.from_now
    ends_at = 1.5.hours.from_now(starts_at)
    ev = Event.create(name: Faker::Lorem.words(5).join(" "), 
                      group: g,
                      description: Faker::Hacker.say_something_smart,
                      address: Faker::Address.street_address,
                      starts_at: starts_at,
                      ends_at: ends_at
                      )
    puts "Created event #{ev.name}"

    u = User.create(email: Faker::Internet.email,
                    password: "password",
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    bio: Faker::Lorem.paragraph,
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    phone_number: Faker::PhoneNumber.phone_number,
                    )
    u.groups << g
    puts "Created user #{u.email} as a member of group #{g.name}"
  end

end

Group.all.each do |g|
  g.user_id = mat.id unless g.user_id
  g.save
end