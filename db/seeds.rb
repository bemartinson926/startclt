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

sharon = User.find_by(email: "sharonhunter@email.com") || 
          User.create(email: "sharonhunter@email.com", 
                     password: "password",
                     first_name: "Sharon",
                     last_name: "Hunter",
                     city: "Charlotte",
                     state: "NC",
                     bio: "This bio is all about me.",
                     phone_number: "704-123-4567"
                     )

blake = User.find_by(email: "blake.martinson@gmail.com") || 
          User.create(email: "blake.martinson@gmail.com", 
                     password: "password",
                     first_name: "Blake",
                     last_name: "Martinson",
                     city: "Charlotte",
                     state: "NC",
                     bio: "This bio is all about me.",
                     phone_number: "704-123-4567"
                     )

# These Groups added manually, not sure how to combine these with rest of file!

Group.create(name:'Charlotte UX', description:'Charlotte UX is for anybody interested in learning more about creating a great user experience. 
  Join us once a month as we get together to discuss user experience design, information architecture, copywriting, analytics, usability studies, 
  sketching and wireframing and much more.')

Group.create(name:'Charlotte JS', description:'This is the home for JavaScript enthusiasts in Charlotte, North Carolina. 
  We are a group of developers and designers that get together and chit chat about the most used and 
  misunderstood scripting language around.')

Group.create(name:'Charlotte IOS Developers', description:'The Charlotte iOS Developers Meetup is group of people 
  interested in building great things on the iOS (and Mac) platform. 
  We meet monthly to learn from each other and talk about what is new in the iOS development community at large.')

Group.create(name:'Charlotte Python Users', description:'Meet other Python users, developers, and enthusiasts of all skill 
  levels interested in discovering and sharing why the Python programming language is such a joy to work with.')

Group.create(name:'Charlotte Front-End Developers', description:'Dedicated to best practices, semantic markup, 
  progressive enhancement and graceful degradation. Over the course of time and quite often we discuss HTML5, CSS, 
  cross-browser support and testing, mobile, optimization techniques and much more.')

Group.create(name:'Digital Marketing', description:'This meetup group is being managed by the American Marketing Association, 
  Charlotte Chapter. The objective of this meetup group is to encourage an open dialogue between professional marketing 
  practitioners and business leaders looking to enhance their marketing strategies.')

Group.create(name:'Charlotte Game Developers', description: 'Interested in building games for your mobile device? Want to share 
  ideas with developers, designer, and artists? Charlotte Game Dev is focused on sharing knowledge about game development using 
  HTML5, WebGL, JavaScript, iOS, Android, NodeJS, SocketIO and many more. We also will look at the libraries and tools to get your 
  game up and running. So come out for some great discussions, food, and networking.')


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