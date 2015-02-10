# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Real users

puts "Creating real users..."

mat = User.find_by(email: "matbanbury@gmail.com") || 
        User.create(email: "matbanbury@gmail.com", 
                     password: "password",
                     first_name: "Mat",
                     last_name: "Banbury",
                     city: "Charlotte",
                     state: "NC",
                     bio: "This is my bio. It's writ good.",
                     phone_number: "704.765.4321"
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

faye = User.find_by(email: "faye@rationalmeans.com") || 
          User.create(email: "faye@rationalmeans.com", 
                     password: "password",
                     first_name: "Faye",
                     last_name: "Cheadle",
                     city: "Charlotte",
                     state: "NC",
                     bio: "This bio is all about me.",
                     phone_number: "704-123-4567"
                     )

zack = User.find_by(email: "zack@techtalentsouth.com") || 
          User.create(email: "zack@techtalentsouth.com", 
                     password: "password",
                     first_name: "Zack",
                     last_name: "Kirchin",
                     city: "Charlotte",
                     state: "NC",
                     bio: "This bio is all about me.",
                     phone_number: "704-123-4567"
                     )

josh = User.find_by(email: "joshholingsworth@mac.com") || 
          User.create(email: "joshholingsworth@mac.com", 
                     password: "password",
                     first_name: "Josh",
                     last_name: "Hollingsworth",
                     city: "Charlotte",
                     state: "NC",
                     bio: "This bio is all about me.",
                     phone_number: "704-123-4567"
                     )

jim =  User.find_by(email: "guest@startclt.com") || 
          User.create(email: "guest@startclt.com", 
                     password: "password",
                     first_name: "Example",
                     last_name: "User",
                     city: "Charlotte",
                     state: "NC",
                     bio: "This bio is all about me.",
                     phone_number: "704-123-4567"
                     )


# Real Groups

puts "Creating groups..."

g1 = Group.find_by(name:'Charlotte UX') || Group.create(user_id: jim.id, name:'Charlotte UX', description:'Charlotte UX is for anybody interested in learning more about creating a great user experience. 
  Join us once a month as we get together to discuss user experience design, information architecture, copywriting, analytics, usability studies, 
  sketching and wireframing and much more.')

g2 = Group.find_by(name:'Charlotte JS') || Group.create(user_id: josh.id, name:'Charlotte JS', description:'This is the home for JavaScript enthusiasts in Charlotte, North Carolina. 
  We are a group of developers and designers that get together and chit chat about the most used and 
  misunderstood scripting language around.')

g3 = Group.find_by(name:'Charlotte IOS Developers') || Group.create(user_id: faye.id, name:'Charlotte IOS Developers', description:'The Charlotte iOS Developers Meetup is group of people 
  interested in building great things on the iOS (and Mac) platform. 
  We meet monthly to learn from each other and talk about what is new in the iOS development community at large.')

g4 = Group.find_by(name:'Charlotte Python Users') || Group.create(user_id: zack.id, name:'Charlotte Python Users', description:'Meet other Python users, developers, and enthusiasts of all skill 
  levels interested in discovering and sharing why the Python programming language is such a joy to work with.')

g5 = Group.find_by(name:'Charlotte Front-End Developers') || Group.create(user_id: blake.id, name:'Charlotte Front-End Developers', description:'Dedicated to best practices, semantic markup, 
  progressive enhancement and graceful degradation. Over the course of time and quite often we discuss HTML5, CSS, 
  cross-browser support and testing, mobile, optimization techniques and much more.')

g6 = Group.find_by(name:'Digital Marketing') || Group.create(user_id: sharon.id, name:'Digital Marketing', description:'This meetup group is being managed by the American Marketing Association, 
  Charlotte Chapter. The objective of this meetup group is to encourage an open dialogue between professional marketing 
  practitioners and business leaders looking to enhance their marketing strategies.')

g7 = Group.find_by(name:'Charlotte Game Developers') || Group.create(user_id: mat.id, name:'Charlotte Game Developers', description: 'Interested in building games for your mobile device? Want to share 
  ideas with developers, designer, and artists? Charlotte Game Dev is focused on sharing knowledge about game development using 
  HTML5, WebGL, JavaScript, iOS, Android, NodeJS, SocketIO and many more. We also will look at the libraries and tools to get your 
  game up and running. So come out for some great discussions, food, and networking.')



def start_time
  (rand(14)-7).days.from_now
end

def end_time(start)
  2.hours.from_now(start)
end

# def fake_address
#   Faker::Address.street_address + ", Charlotte, NC"
# end

def packard_place_address
  "222 South Church Street, Charlotte, NC 28202"
end

def think_809_address
  "809-D W Hill St, Charlotte, NC"
end

def skookum_address
  "201 South Tryon Street, Charlotte, NC 28202"
end

def myjive_address
  "1000 NC Music Factory Boulevard, Charlotte, NC 28206"
end

def select_address
  [packard_place_address, think_809_address, skookum_address, myjive_address].sample
end

puts "Creating 10 events per group..."

# Create 10 events per group
starts_at = start_time
ends_at = end_time(starts_at)

g1_e0 = Event.create(name: "The Art & Process of Storytelling",
                     group_id: g1.id,
                     description: "The team at Myjive will lead a panel discussion dissecting the design and development process behind a new Credit Union website. Get a candid look into the art of storytelling and how they crafted a new way to sell bank services.

• From sketching to prototype, don't wireframe.

• The details are in the style sheets.

• UX vs Design vs Marketing... who wins? And where does Art and Copy stand?

• The power of custom photography.

Panel Speakers:

(Moderator) Ron Edelen, Partner + Design Director

Caleb Loffer, Senior Developer

John Howard, Senior Interactive Art Director

Shelton Clinard, Photographer + Interactive Developer 
Schedule:

• 6:30 - 7:00 Network and Food

• 7:00 - 8:00 Talk/Session",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g1_e1 = Event.create(name: "Cultivating UX",
                     group_id: g1.id,
                     description: "Last January, the UX team from American City Business Journals pulled the curtain back on what it’s been like to build and maintain a UX department within an existing enterprise. It’s time to check in and see what they managed to accomplish last year, how they adapted to organizational change, and what adjustments they’re making for success in 2015.

The Topics:

To Inform and Influence 
Will Hortman, Director, User Experience 
@willhortman

Designing for the Conversation 
Joshua Mauldin, Senior Product Designer, Mobile 
@joshuamauldin

Scrappy Usability Testing 
Amy Henty, CUA, User Experience Designer 
@theamylynn


Schedule:

• 6:30 - 7:00 Network and food 
• 7:00 - 8:30 Session/Presentation",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g1_e2 = Event.create(name: "Web Afternoon + Annual Charlotte Tech Meetups Holiday Party",
                     group_id: g1.id,
                     description: "Join us for an afternoon for people who love the web over at Wells Fargo Auditorium from 1-6pm. After the mini-conference Packard Place will be hosting our annual holiday tech party for all of our local meetup groups.

You can find details and registration at http://charlotte.webafternoon.com/",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g1_e3 = Event.create(name: "You Should Be Using SVG (Ben Visser says so)",
                     group_id: g1.id,
                     description: "SVG is the new hotness for vector graphics on the web. Browser adoption for SVG has hit the sweet spot and, with new screen sizes and densities being added at an extremely fast rate, we have to think scalable, responsible and flexible.

Whether you know all about SVG, or are just starting to dip your toes in the water, we would love to have you join us to discuss this topic. We'll touch on SVG basics and show off some simple examples of how you can implement SVG into your workflow immediately. Some items we will cover will include:

• What makes SVG great? 
• How do I use SVG? 
• Responsive Icons and Logos with SVG 
• Animation Techniques with SVG 
• Clever SVG Uses and Examples 
• SVG Resources list",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g1_e4 = Event.create(name: "UX Futures Summit",
                     group_id: g1.id,
                     description: "Rosenfeld Media, Environments for Humans and Charlotte UX bring together some of the Web's most notable experts in for an all-new, one-day only online conference, the UX Futures Summit 2014!

Registration begins at 9am. Lunch will be provided from 1-2pm.

• 10:00am - Design to the Power of Ten by Andy Polaine, Service and Interaction Design Consultant

• 11:00am - A World Made of Information by Abby Covert, Independent Information Architect 
• 12:00pm - What If It Turns Out Steve Jobs Wasn't an Alien? by Steve Krug, Author of Don't Make Me Think and Rocket Surgery 
• 2:00pm - Interaction Design Lessons Literally from the Future by Nathan Shedroff, Serial Entrepreneur, Experience Designer, Business Strategist 
• 3:00pm - Expanding our Expectations of ‘Everyone’ by Margot Bloomstein, Author of Content Strategy at Work 
• 4:00pm - UX: The First 50 Years by Jesse James Garrett, Author of The Elements of User Experience ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g1_e5 = Event.create(name: "Lightning Talks",
                     group_id: g1.id,
                     description: "Join us for a rapid lightning talk event where a number of your fellow peers will be sharing quick spurts of knowledge with you in 5-10 minute increments. Slides are optional.

Interested in giving a lightning talk? Let us know.

We'll post topics as they come in. Here's what we have so far:

• Maria Frey, Using Behavioral Science for Design

• Bermon Painter, 5 UX Activities to Create Collaborative Meetings

• Nate Ernst, No one knows where they are: context and design",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g1_e6 = Event.create(name: "Blend Conference - 3 days of user experience, design, and development.",
                     group_id: g1.id,
                     description: "With Blend Conference coming to town this month we're going to take a break until October. If you haven't heard of Blend Conference it's a 3-day event here in Charlotte with 60+ diverse speakers, 8 workshops, 48 sessions and a nifty no-device policy. 

There are some amazing speakers coming into town, including Mike Monteiro, Chris Coyier, Angel Anderson, Paul Trani, Mark Boulton, Allison House, Abby Covert & Paul Boag.

I encourage you to attend and support a local Charlotte conference. Day passes for Thursday, Friday or Saturday are available. 
Don't miss out. Go register for Blend Conference.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g1_e7 = Event.create(name: "Integrating User Experience and Agile",
                     group_id: g1.id,
                     description: "Many companies mistakenly view Agile as nothing more than a process or methodology that will solve their development woes and permit them to launch better software faster. In this presentation Bermon will focus on sharing Agile as a way to think about how to software could be created and ways user experience can be integrated. UX practitioners, designers, and developers are all welcome.

Attendees will discover:

• a better definition of User Experience and the disciplines involved

• a brief explanation of Agile

• difficulties that exist when integrating user experience and Agile 

• ways to improve integrating user experience in an Agile setting",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g1_e8 = Event.create(name: "CRUX (Cryptography + User Experience)",
                     group_id: g1.id,
                     description: "Justin Troutman joins us to explore the progression of cryptographic failure as a result of the poor interfacing of cryptographic concepts to consumers. CRUX, or cryptography plus user experience, is based on the premise that real-world cryptography is not about cryptography at all; it's about product design — therefore, UX-driven. In order for cryptography to be beneficial, the surface for interfacing it must be benign and approachable, making it hard to get wrong, and easy to get right.

Justin Troutman is a cryptographer-for-hire who believes that realizing the cypherpunk dream depends on finding the sweet spot between a tactile, palatable user experience and consistently airtight OPSEC. His research interests include building and breaking authenticated encryption designs, analyzing HUMINT/SIGINT methodologies, and, now, seeing CRUX through to fruition. He also has the likely distinction of sporting the strongest Southern drawl of any cryptographer in history.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g1_e9 = Event.create(name: "More Than UI: How the Brand Plays a Role in the User Experience",
                     group_id: g1.id,
                     description: "For years, branding and user experience design seem to be a discipline mixture more reminiscent of oil and water than peanut butter and jelly. However, the need for companies to communicate their values, messages, personality and products in a multi-channel yet consistent experience makes the line between branding and experience design razor thin. Touching on the intersection of marketing, service design, product design, technology, and customer/user experience, this talk will consider what the UX designer’s role could be within this landscape and whether or not we are (or should be) considering the brand experience in user experience design.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)


g2_e0 = Event.create(name: "Lightning Talks",
                     group_id: g2.id,
                     description: "We had to reschedule ClojureScript with Ben to next month. We’d like to kick the year off with 5-10 minute lightning talks. Any topic related to JavaScript is welcome. Slides are optional.

Let’s kick off the year sharing what we’ve been up to and what we’re interested in.

We look forward to seeing you all on Thursday.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g2_e1 = Event.create(name: "Annual Charlotte Tech Meetups Holiday Party",
                     group_id: g2.id,
                     description: "Join us along with the Ruby, PHP, Python, et cetera, et cetera meetups for our annual Christmas party. 
RSVP at http://charlotte.webafternoon.com/. 
Look forward to seeing you there! ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g2_e2 = Event.create(name: "Accessibility in JavaScript",
                     group_id: g2.id,
                     description: "Melissa Avery-Weir will be giving a presentation on making the web accessible via JavaScript. More information to come... ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g2_e3 = Event.create(name: "Azure Dev Camp - Charlotte",
                     group_id: g2.id,
                     description: "Note: Node.JS is supported and you can even code/deploy from Visual Studio. Come learn more.

This is not necessarily JUST for devs. I would recommend this session for IT Pros, Architects, Developers and IT Executives. I'll be teaching along with a few colleagues and MVP's. Its an all day free training with food. Register with this link: http://aka.ms/clouddevcamps We are covering a TON of material from automation to analytics to the app platform to security and compliance. There will be coffee, food, snacks etc. Nov 18 9am-4:30pm",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g2_e4 = Event.create(name: "Pizza, BYOBeverage, and Web Components",
                     group_id: g2.id,
                     description: "Hey folks,

We’re meeting tonight! We'll have a brief presentation on web components but we're also hoping that you can participate! Come, hang out, share what you’re working on, meet some smart people!

We look forward to seeing all of you! ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g2_e5 = Event.create(name: "TypeScript",
                     group_id: g2.id,
                     description: "Gregory Avery-Weir will be introducing us to TypeScript.

TypeScript is a transcompiling superset of Javascript that brings some of the coolest features of ECMAScript Harmony to current browsers. Gregory will show how TypeScript can help you build and manage complex object-oriented web applications with examples drawn from the in-development web game Exploit: Zero Day.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g2_e6 = Event.create(name: "PencilBlue",
                     group_id: g2.id,
                     description: "PencilBlue is the first full featured CMS and blogging platform for Node.js. It's built upon an MVC architecture and utilizes a plugin system that allows for complete override of the core platform. PencilBlue comes with MongoDB and Redis out of the box, but it abstracts its data providers and services, making it's possible to implement the database of your choosing.


PencilBlue CTO, Brian Hyder, will give a guided tutorial of PencilBlue and how to create your first plugin for it. ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g2_e7 = Event.create(name: "The power of ES6",
                     group_id: g2.id,
                     description: "We’re going to learn what ES6—the next evolution of the JavaScript language—brings to the table. And how you can start using it today!",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g2_e8 = Event.create(name: "Traces of Errors: Getting Better JavaScript Stacktraces",
                     group_id: g2.id,
                     description: "JavaScript dies in many ways: maybe a script failed to load, maybe AJAX came back in the wrong order, or maybe the browser is doing something weird. Whatever the reason, too often our only clue is:

'TypeError: e is undefined. scripts.js. line 1'

Let's stop playing that game. Let's go on a scavenger hunt! Hidden in our code is the secret to actually *getting* the Stacktraces from JavaScript errors. Then, let's explore ways to add more context to *get better* stacktraces that convey more meaning about the state of our application when it failed. About Todd 
Todd H Gardner is an independent software developer and entrepreneur, with over a decade of experience in development, design, and leadership. Todd holds a Masters in Management of Technology from the University of Minnesota.

He is passionate about teams, communication, and quality in software and has led product teams from small businesses and major corporations.

Todd is the co-founder of {Track:js}, an innovative JavaScript error logging service. He tweets at @toddhgardner.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g2_e9 = Event.create(name: "ES6 Generators",
                     group_id: g2.id,
                     description: "Garrett Johnson will be presenting on generators: how they work and how to use them for async flow control. 
NOTE: You can park anywhere but you need to enter the main entrance of he corporate office to find us (https://i.cloudup.com/0KGEgnipKz.jpg). If you get lost or end up in the wrong building, call[masked] for help.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g3_e0 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "Peter Zignego (@pvzig) is going to take about i18n (Internationalization) of iOS apps. He's going to go over some lessons learned from working on doing this to an existing app that has tens of thousands of users.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g3_e1 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "We'll try and have something posted on the topic for the Meetup a few weeks before it happens.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g3_e2 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "Harish Yarlagadda is going to talk about what Cocoapods is and how to use it to in your projects.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g3_e3 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "This month's talk at the Charlotte iOS Developers Meetup, Peter Malmgren is gong to talk about the fundamentals of unit testing, and how to utilize unit testing to reduce bugs in our apps and to make our code more maintainable.

Topics will include the XCTest framework, asynchronous testing, mocking, and test driven development.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g3_e4 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "This week we'll be talking about Swift and what it means for the future of iOS development, and then a brief demo of the language using XCode 6 and playgrounds.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g3_e5 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "Networking and knowledge sharing...",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g3_e6 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "Networking and knowledge sharing...yet again",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g3_e7 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "Networking and knowledge sharing...",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g3_e8 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "Networking and knowledge sharing...",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g3_e9 = Event.create(name: "The Charlotte iOS Developers Monthly Meetup",
                     group_id: g3.id,
                     description: "Networking and knowledge sharing...",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g4_e0 = Event.create(name: "Annual Charlotte Tech Meetups Holiday Party",
                     group_id: g4.id,
                     description: "The annual cross-meetup Christmas party is being held at The Garage at Packard Place from 7:00-9:30 Friday evening. Meet fellow enthusiasts from JS, Ruby, PHP and UX meetup groups!

The party is being held after a half-day Web Afternoon conference which you should definitely check out. RSVP for the Christmas party or the conference or both at http://charlotte.webafternoon.com/ 
Food and drink will be provided.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g4_e1 = Event.create(name: "Hack Night",
                     group_id: g4.id,
                     description: "This meetup will be an unstructured get together. Get help with something that's been stumping you. Show off your pet project. Tell everyone about the cool new thing you just learned. Pick each other's brains. Learn. Teach. 

If you have any questions or suggestions feel free to reach out to me (Hans).",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g4_e2 = Event.create(name: "Hack Night",
                     group_id: g4.id,
                     description: "This meetup will be an unstructured get together. Get help with something that's been stumping you. Show off your pet project. Tell everyone about the cool new thing you just learned. Pick each other's brains. Learn. Teach. ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g4_e3 = Event.create(name: "Google App Engine & Python",
                     group_id: g4.id,
                     description: "I'd like to suggest a meetup around Google App Engine using Python. I am new to GAE and have used it in small applications while learning it, and would really appreciate to find and meet people who are more savvy and use this in real life. 
Google App Engine is a Platform as a Service (PaaS) offering that lets you build and run applications on Google’s infrastructure (more info at https://developers.google.com/appengine/)",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g4_e4 = Event.create(name: "IPython",
                     group_id: g4.id,
                     description: "Come out and learn about IPython.Vitaly Babiy will be showing us the ropes on this handy tool. You can find out more about it here: http://ipython.org/

There also may be a brief opening Python tutorial.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g4_e5 = Event.create(name: "Intro to Pandas",
                     group_id: g4.id,
                     description: "This month Chris Widman will be giving an introduction to Pandas, a library to help you do data analysis with Python.

You can read about pandas here: http://pandas.pydata.org/",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g4_e6 = Event.create(name: "Profiling. Or, Why is my code so slow?",
                     group_id: g4.id,
                     description: "This month we'll talk about profiling your python code so that you can figure out what's taking so long.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g4_e7 = Event.create(name: "Playing with pandas, Vincent Vega and d3",
                     group_id: g4.id,
                     description: "Generating data visualizations programmatically with pandas, vincent, vega and d3.

Food and drink generously provided by TEKsystems.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g4_e8 = Event.create(name: "Natural Language Processing with NLTK",
                     group_id: g4.id,
                     description: "I recently went to a DC NLP meetup for big data + NLP and saw a presentation on using Hadoop with NLP, strengths and weakness, etc. The presenter really made a strong case for using NLTK and there's a great free book out there for it. Maybe we could make a series out of going through chunks of the book and then hacking an application together for it each time. For example:

1. Meet and discuss the first chunk of the book and assign 'homework' to create a simple application with the techniques discussed in that chunk of the book.

2. Present applications at the next meetup. Assign next chunk. Repeat.

3. Synthesize the smaller applications after finishing the book?",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g4_e9 = Event.create(name: "CharPy September 2013: Scrapy",
                     group_id: g4.id,
                     description: "This month we have a tour of Scrapy given by Dan Koch. Scrapy is a screen-scraping and web-crawling framework that you can use to crawl web pages and extract structured data from them. You can find out more at the Scrapy website http://scrapy.org/

Additionally, since we had a number of people just getting started with Python at the last meeting, we'll begin the meeting with a short tutorial on a basic Python topic.

Finally, short lightning talks or show-and-tell of a cool project you've found or are working on are welcome.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g5_e0 = Event.create(name: "Front-End Workflows with Gulp",
                     group_id: g5.id,
                     description: "From time-to-time our front-end workflows can get pretty repetitive. Sometimes we attempt to manually compile pre-processed languages, minify & concatenate our code. In this session Bermon will review common front-end workflows and how they can be automated with GulpJS. Front-end developers of any level are encouraged to attend.

Attendees will discover:

•  the concepts behind using Gulp as a build tool 

• differences between Gulp and Grunt

• how to use the Gulp API

• step-by-step tutorial on how to write common workflow tasks some of the best plugins currently around",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g5_e1 = Event.create(name: "Web Afternoon + Annual Charlotte Tech Meetups Holiday Party",
                     group_id: g5.id,
                     description: "Join us for an afternoon for people who love the web over at Wells Fargo Auditorium from 1-6pm. After the mini-conference Packard Place will be hosting our annual holiday tech party for all of our local meetup groups.

You can find details and registration at http://charlotte.webafternoon.com",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g5_e2 = Event.create(name: "Intro to AngularJS",
                     group_id: g5.id,
                     description: "AngularJS is an up-and-coming JavaScript framework supported and maintained by Google. Over the past year, usage for the framework has exploded, giving many developers reason to believe it's the next big thing. In this presentation, Angular developer Sarah Hudson will cover the basics of what Angular is and what it can do for your projects, as well as breaking down the components of Angular and what makes it unique and gives developers more control over custom templates and elements. 

Attendees will learn about:

• Core structure and components of Angular, such as custom directives, factories for sharing data, two-way binding, and modules

•  Companion libraries to Angular, such as the popular AngularUI suite which includes UI-Bootstrap

A brief overview of routing options from Angular's native routing to UI Router, and how it offers flexibility for your apps",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g5_e3 = Event.create(name: "Breaking Free from Bootstrap",
                     group_id: g5.id,
                     description: "Resources links easier to get to, adds a few new resources, & has a PDF download link for slides: http://jamessteinbach.com/css/sass/breaking-free-bootstrap/

Also, quick reminder that if you're interested in a monthly Sass meetup, sign up for the email list at cltsass.com, thanks!",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g5_e4 = Event.create(name: "Animating SVGs with CSS",
                     group_id: g5.id,
                     description: "Tessa Harmon, from Skookum Digital Works, joins us to talk about how to animate SVG with CSS. While the properties of an SVG that can be animated through CSS might seem minimal, you can still achieve some pretty awesome effects.

In this talk, she aims to:

• Break down my process for creating animations, including Grunt workflow.

• Explain special considerations when working with SVG, and basic troubleshooting (such as bounding boxes, optimization, and responsive scaling).

• Review the animatable properties of an SVG and creative ways of making the most out of its limitations.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g5_e5 = Event.create(name: "Digging into the Grunt work of Development",
                     group_id: g5.id,
                     description: "Ever take a moment to look at your development process and realize there's a lot of rote, repetitive tasks you have to perform in order to shape your code up to run? Things like pre-processing files, minification, bundling, tagging releases in source control, deploying the application, etc. Sure you can do it manually, but do you remember all the steps every single time? How about if there's multiple developers on the team who don't always do those tasks? That's where a tool like Grunt comes in useful as it can automate a lot of things from the NodeJS environment and it lives with your source code so the entire team benefits. If you can perform the task from the command line or with some server-side Javascript, you very likely can automate the process. This presentation assumes at least a familiarity with Javascript & NodeJS, and will get you up and running with Grunt.

About our Speaker

Steve Evans fell in love with programming since writing programs on his TI-83 calculator back when spaghetti code was the only way to code. Since then he's learned better ways to structure code, and has found a passion in helping teams write maintainable code and sharing knowledge. Although most of his experience has been in the .NET space, he is always tinkering in other languages and paradigms to find better ways to solve problems without necessarily having to reinvent the wheel. He's given talks at user groups and conferences on topics from WCF to SOLID principals to running an Open Source project.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g5_e6 = Event.create(name: "Test Framework Shootout: QUnit",
                     group_id: g5.id,
                     description: "Bermon joins us to wrap up our 3-week comparison with Jasmine, Mocha, and QUnit. Our focus will be discussing the ins/outs of QUnit and then a quick comparison with Jasmine and Mocha.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g5_e7 = Event.create(name: "Test Framework Shootout: Mocha",
                     group_id: g5.id,
                     description: "Here are the slides from my talk on Mocha (and Chai): https://speakerdeck.com/vjwilson/front-end-testing-with-mocha",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g5_e8 = Event.create(name: "Test Framework Shootout: Jasmine",
                     group_id: g5.id,
                     description: "Slides from tonights meetup. https://speakerdeck.com/bermonpainter/test-framework-shootout-jasmine",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g5_e9 = Event.create(name: "Fostering Collaboration with Pattern Libraries",
                     group_id: g5.id,
                     description: "Recognize the benefits of using a living pattern library and rapid prototyping to increase communication and collaboration between designers and developers. In this session we will review a case study from an enterprise-level development group traditionally staffed with 60+ developers and no designers and how they were able to implement a pattern library and rapid prototyping framework into their design and development process. In this session we will discuss:

• recognizing patterns 

• modular pattern creation with Sass/Compass/Slim/JavaScript 

• how patterns can be combined to be used during rapid prototyping 

• developing a consistent language that can be used between designers and developers",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g6_e0 = Event.create(name: "The Importance of Marketing to Women",
                     group_id: g6.id,
                     description: "t’s no secret that women have major economic influence in the current marketplace. While progress has been made to target the female audience, now -more than ever- is the time for women to become more involved in how digital marketing is done.

Join CAMA as we host this month’s Digital Marketing event at Union along with special guest speaker Valerie McMurray. McMurray is currently the principal of NorthStar Consulting Group and has 25+ years of human capital management and executive coaching experience.  

Come out for a few light refreshments and learn more about the importance of women in leadership roles, how women can help businesses hit missed “targets” and how women are key players in the future of marketing. ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g6_e1 = Event.create(name: "Silver Bells Shindig",
                     group_id: g6.id,
                     description: "Dust off your finest pearls and dapper bow ties, because it’s time to party like its 1959 with all of Charlotte’s Top Professional Organizations! The Charlotte American Marketing Association is joint venturing with five other marketing groups (BMA, CDMA, CIMA, IABC, and SMCLT) for our annual holiday social.

Dress in your best vintage cocktail attire and celebrate the Season of Giving with us at Automatic Slims in the NC Music Factory.

Charlotte's Premier Professional Organizations have partnered with Levine Children’s Hospital for this premier event. Since you're part of this group you're welcome to join in. All members and nonmembers are invited to attend to network, enjoy appetizers and drinks, and dance with a $10 donation or Levine Children’s Hospital Wish List Item.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g6_e2 = Event.create(name: "Magical Agency Tour | Eric Mower + Associates",
                     group_id: g6.id,
                     description: "ou don’t know what you will find on the Magical Agency Tour! Be sure to stick around because Eric Mower + Associates will be having a giveaway that you won’t want to miss!

EMA is a leading independent agency specializing in B2B, consumer advertising, shopper marketing and digital/direct/relationship marketing. Eric Mower + Associates believe that building a brand in the digital age requires an entirely new approach- one that positions your brand not merely as a product or service, but as a friend. By leveraging key drivers of friendship to build affection, relevance and trust with your audiences, they can help you become a very special, very different kind of brand. The kind that people want to connect with, listen to, and make part of the way they live or do business.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g6_e3 = Event.create(name: "Changing Behavior by Design",
                     group_id: g6.id,
                     description: "People are complex creatures. Our behavior is often irrational, idiosyncratic and just plain strange. That's why designing compelling products and interactive experiences is often difficult. Luckily, there are concrete steps designers can take to make their designs more effective.  
In this kick-off to the CAMA Signature Series for the year, you will:

• Find out why humans are simply an operating system loaded with bugs

• Learn how to frame messaging to match people's worldview

• Understand the three key components of behavior change

• Get tips on how to persuade irrational people

• Learn the latest science of building & forming habits ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g6_e4 = Event.create(name: "Call for Volunteers - Charlotte American Marketing Association",
                     group_id: g6.id,
                     description: "The Charlotte American Marketing Association is hosting a call for volunteers as we kick off our new fiscal year. We'll be unveiling some key programming initiatives on how we can have more frequent meetups for the marketing community. 

Our board members will also be on hand to showcase which committee roles you can participate in. ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g6_e5 = Event.create(name: "Market Charlotte 2014",
                     group_id: g6.id,
                     description: "Join the Queen City's marketing community on Wednesday, April 16th at Roof With A View.

Mark your calendars! marketCHARLOTTE, an evolution of the annual Marketing Forecast, is back for its third year. This event brings together 200+ marketers, advertisers, designers, communication professionals, etc. for an evening of thought-provoking discussion and networking.

Come out to hear and interact with the city's smartest thought leaders in marketing. Audience members can expect to walk away inspired with proven strategies to consider applying to their own organization's growth.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g6_e6 = Event.create(name: "Social Storytelling with BuzzFeed",
                     group_id: g6.id,
                     description: "Join the Charlotte American Marketing Association as we host a representative from BuzzFeed, the social news and entertainment media company. BuzzFeed is redefining online advertising with its social, content-driven publishing technology. BuzzFeed provides the most shareable breaking news, original reporting, entertainment and video across the social web to its global audience of 100M. 
Brands have such amazing stories to tell and today's heavy-handed digital advertising often gets in the way. BuzzFeed is uniquely positioned to help brand's tell amazing consumer-first stories across their initiatives.

75% of users come to BuzzFeed to find something to share, these are socially active, socially savvy people who are spending time consuming and sharing content, thus people who are very likely to spend time with your brand and share interesting content we publish together with their friends. ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g6_e7 = Event.create(name: "Reindeer Games | CAMA Holiday Social",
                     group_id: g6.id,
                     description: "Our sponsor, the Charlotte Chapter of the American Marketing Association is having their Holiday Social and the Digital Marketing group is invited! Come join us for fun, friends, and food as we celebrate the holiday season!

The theme is Reindeer Games and we will be collecting games to be donated to the Ronald McDonald House.

Your $10 cost of admission includes one drink and appetizers. Register here or through Eventbrite at https://camareindeergames.eventbrite.com",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g6_e8 = Event.create(name: "The Art & Science of Retargeting",
                     group_id: g6.id,
                     description: "Join the Charlotte American Marketing Association as we host a discussion about the art and science of retargeting.  Only 2-5% of people convert on their first visit to a website? Retargeting at its best is a powerful and effective means to engage and inspire your audience. However, few marketers retarget correctly. Successful retargeting respects the user and provides them with real value at the right time. Brian Easter tells you how to get creative, test new strategies, and create ads that speak to customized audience segments, providing them with real value.

Program Agenda

5:30 pm – 6:00 pm:   Networking 
6:00 pm – 7:00 pm:   Presentation 
7:00 pm – 7:30 pm:   Audience Q&A",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g6_e9 = Event.create(name: "Google Glass Panel Discussion",
                     group_id: g6.id,
                     description: "Join the Charlotte American Marketing Association as we host a discussion about Google Glass and how it may impact the future of marketing. Learn what our panelist have done with their pair of Google Glass, how they were selected to receive a pair, interesting use cases they have seen with the device and what they have heard about the future of wearable technology.

Already have questions for our panel members? Place it in the comments sections below so we can include it as part of our overall discussion.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g7_e0 = Event.create(name: "Global Game Jam 2015",
                     group_id: g7.id,
                     description: "The Global Game Jam is taking place in Charlotte at UNCC

http://globalgamejam.org/2015/jam-sites/university-north-carolina-charlotte",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g7_e1 = Event.create(name: "Off the Rails",
                     group_id: g7.id,
                     description: "App designer Dan Russell-Pinson will present a case study of his most recent roller coaster game — Off the Rails.  He will discuss the basic approach he took to make the game including: simulating the vehicle’s physics (both on and off the track), dynamically building a 3D roller coaster track, optimizing the game for performance and building the basic 3D environment. Depending on the time available, he can dive into the Unity project and C# code and answer any specific questions the audience may have.

Speaker: Dan Russell-Pinson is an independent game developer and the creator of several top 10 educational apps including Stack the States, Stack the Countries, Tower Math, Collider and Monster Physics. He studied Computer Science at Clemson University and combines his interests in programming, graphics, music and sound to create games that are both educational and fun.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g7_e2 = Event.create(name: "Unity3D Starter Kit w/Universal Build",
                     group_id: g7.id,
                     description: "Show off the new starter kit. How it is built, how it works, ideas on how to take it further. Show off the Universal build that comes with the kit and review publishing and Universal Builds. ",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g7_e3 = Event.create(name: "Project Spark and Kinect 2",
                     group_id: g7.id,
                     description: "Come on out for a great presentation on Project Spark and Kinect 2

Project Spark is an interesting game, or rather, simulation. 

This isn't just because it allows you to create games, but also in the way it teaches programming principles. It does so in a visual way, with icons instead of actual code. That's not the only thing Project Spark does though. Users have the capability to upload their projects and let others rate their creations. They can even implement improvements on original creations, this is referred to as Remixes. While Project Spark isn't necessarily a game, it does offer something significantly different to anything else available at the moment.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g7_e4 = Event.create(name: "Corona Cards for Windows Phone 8",
                     group_id: g7.id,
                     description: "Larry Meadows will demonstrate Corona Cards ( beta ) for Windows Phone 8 from Corona Labs.

Corona is a LUA based game and physics engine with over 1000+ APIs that supports devices for Android, IOS, Amazon, Books a Million and more ( and now Windows 8 Phone) .

Corona Cards for Visual Studio allows Corona developers to deploy their current LUA applications to easily support Windows 8 Phone with virtually no coding changes.

Larry will show how easily it is to port a LUA app to windows 8 phone.

Larry will also show how easy it is to add Native Windows 8 Ads to an App and how to extend communication between LUA and Native Windows 8 Phone API calls.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

sleep(1)

starts_at = start_time
ends_at = end_time(starts_at)

g7_e5 = Event.create(name: "Share and Polish",
                     group_id: g7.id,
                     description: "This meeting is dedicated to showing what you have been working on and getting some help, ideas, or testers to get the polish on your game.  Also, come if you have an idea for a game and run it by the group for feedback and suggestions.  

Location: Microsoft Campus 

Food Sponsor: Meridian Technologies",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g7_e6 = Event.create(name: "Unity 2D Workshop",
                     group_id: g7.id,
                     description: "Announcing Unity 2D Workshop!

Ever wanted to know just how hard it is to build a game like Donkey Kong or Super Mario Bros?  Well, the wait is over.  Bring your laptops ready to build a 2D style game.  

If you have no experience with Unity, no problem, we will walk you through the editor and get you comfortable.

This will be an all day event.  You will need to bring a laptop that has Unity 2D installed?  If you don't have the latest, we will try and have it on a thumb-drive so you can install it quickly.

We will have a light breakfast and lunch provided as well.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g7_e7 = Event.create(name: "Introduction to Construct 2 & more...",
                     group_id: g7.id,
                     description: "ummary: We are in for two great presentations!

PRESENTATION - Creating Awesome Graphics for your Apps and Games with PowerPoint. Seriously! There are tons of graphics programs out there, some very expensive and complicated, some cheap and complicated, and some just worthless. One program almost every has access to is Microsoft Powerpoint. In this presentation you will learn how to easily make great graphics with PowerPoint and take advantage of the secret drawing features. PRESENTATION 2 - Introduction to Construct 2 Construct 2 is cross-platform game creation tool. It is extremely powerful, easy to learn, and constantly improving. This presentation will provide an introduction and demo of Construct 2. Steve has created all his Windows and Windows Phone apps with Construct 2.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g7_e8 = Event.create(name: "Dev Ops and Release Management for Unity Games",
                     group_id: g7.id,
                     description: "Development Operations and Release Management for Unity Games will cover many of the challenging aspects of dealing with large binary assets that games have, version control, branching and merging strategies, building your release pipeline for various platforms, ensuring your proper development branches are well maintained, some theory behind that as well as how to use the agile project planning tools. This will all be done using TFS Online and Visual Studio Team Explorer.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )

starts_at = start_time
ends_at = end_time(starts_at)

g7_e9 = Event.create(name: "Designing a Game - Concept to Polish",
                     group_id: g7.id,
                     description: "This talk will explore the process of designing a game, as opposed to programming a game. We'll start with developing a concept, look at how to form mechanics and interplay, move on to challenge and level design, and briefly discuss polish. Along the way we'll sketch out an original game together.

Portions of this talk are taken from Anna Anthropy's Level Design Lessons.

Speaker:  Gregory Avery-Weir is a game designer with Future Proof Games. His Flash games have had millions of plays and Future Proof recently released their first retail downloadable title, Ossuary. They are currently working on their upcoming game, code named Zero Day.",
                     address: select_address,
                     starts_at: starts_at,
                     ends_at: ends_at
                     )


real_users = [ mat, sharon, blake, faye, zack, josh, jim ]

all_groups = [ g1, g2, g3, g4, g5, g6, g7 ]

puts "Adding groups, events, and membership roles to real users..."

# Add groups, events, and membership roles to real users
roled = []
all_groups.each do |g|
  User.all.each do |u|
    unless u.groups.include? g
      u.groups << g
      membership = u.memberships.last
      MembershipRole.create(membership_id: membership.id, role: 0)
    end
  end
  # Add 5 events from each group
  User.all.each do |u|
    events = g.events.sample(5)
    events.each do |e|
      u.events << e
    end
  end
end

puts "Creating 100 fake users and adding groups..."

# Create fake users
100.times do
  u = User.create(email: Faker::Internet.email,
                  password: "password",
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  bio: Faker::Lorem.paragraph,
                  city: "Charlotte",
                  state: "NC",
                  phone_number: Faker::PhoneNumber.phone_number,
                  )
  # Add fake user to 3 random groups
  selected = []
  3.times do
    g = (all_groups - selected).sample
    u.groups << g
    selected << g
    # Add 'member' role to user u for group g
    membership = u.memberships.last
    MembershipRole.create(membership_id: membership.id, role: 0)
  end

  # Add random events from their groups to each user
  u.groups.each do |g|
    g.events.each do |e|
      if rand(0..1) == 1
        u.events << e
      end
    end
  end

  u.save
end