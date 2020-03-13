  require 'nokogiri'
require 'open-uri'
require 'pry-byebug'

Review.destroy_all
Booking.destroy_all
Package.destroy_all
Attendeeshotpreference.destroy_all
Shotpreference.destroy_all
Availablephotographer.destroy_all
Event.destroy_all
Photographerspecialty.destroy_all
Specialty.destroy_all
Photographer.destroy_all
Attendee.destroy_all
User.destroy_all

# constants only exist in the seed file and we would not have a link to them
# # # Packages
CATEGORIES = ["SICKO Mode", "How do you want it?", "Timezones"]
PRICES = [750, 400, 250]
DESCRIPTIONS = ["Dedicated attention for the entire event by one our our professional photographers!", "Book a time slot for 1-2 hours for a dedicated session of high caliber photography!", "Periodic attention where our team will capture moments throughout your event experience"]
SESSIONS = ["Dedicated session", "Periodic session"]

puts 'Packages loading up...'
# # # Preferences
PREFERENCES = ["Candid", "Portrait", "Group", "Creative Shots", "Art Installations", "Venue/Artists" ]

# # # Events
TYPES = ["Multi-day Festival", "Single-day Festival", "Concert"]
PARTNERSHIPS = ["Yes, food truck: allocate 1 photographer", "Yes, Radiate: allocate 2 photographers", "No, Party Reel only"]
GENRES = ["Hip Hop", "Rock", "Metal", "EDM", "Mixed", "Folk", "Bluegrass", "Jazz", "Reggae", "Punk", "Alternative", "K-Pop", "Country"]

puts 'Oh, you want events? Here they come!'

# # # AvailablePhotographers
FULLYBOOK = ["Free", "Full", "Partially"]

# # # Photographers
SPECIALTIES = ["Urban", "Fashion", "Action", "Nature", "Landscape", "Food"]
PROFESSIONS = ["Photographer", "Videographer", "Both"]

puts 'Linking to our photographers...'
# # # Attendee
INTERACTIONS = ["Behind the scenes", "With our group", "A mix of both"]
INFLUENCERS = ["I will only use for personal use", "I plan to make a profit from these photos"]

# Reviews
REVIEWS = ["So awesome, our photographer captured our event really well!", "Such a cool experience.  We didn't have to lift a finger :)", "We'll be booking Party Reel again, no doubt!"]

puts 'Last, but not least, our attendees'

# # UserAttendee
user_login = User.new(password: 'password', email: 'user1@gmail.com')
user_login.first_name = 'John'
user_login.last_name = 'Denver'
user_login.location = 'Denver'
user_login.email = 'user1@gmail.com'
user_login.user_ig_handle = 'party.reel'
user_login.save!
puts "Created #{user_login}"
user_login.save!

attendee = Attendee.new(user: user_login)
attendee.interaction = INTERACTIONS.sample
attendee.influencer = INFLUENCERS.sample
attendee.save!
puts "Created #{attendee}"

# # UserPhotographer

user_login = User.new(password: 'password', email: 'user2@gmail.com')
user_login.first_name = 'Joe'
user_login.last_name = 'Dimagio'
user_login.location = 'Brooklyn'
user_login.email = 'user2@gmail.com'
user_login.user_ig_handle = 'party.brooklyn'
user_login.save!
puts "Created #{user_login}"
user_login.save!

photographer = Photographer.new(user: user_login)
photographer.phone_number = '212-555-2121'
photographer.camera = 'Canon'
photographer.lenses = '24-105mm'
# photographer.specialty = 'Urban'
photographer.profession = 'Photographer'
photographer.save!
puts "Created #{photographer}"

EVENTURLS = ['welcome-to-rockville-2019/', 'hangout-fest-2019/', 'electric-forest-2019/', 'coachella-music-festival-2019/', 'aftershock-festival-2019/','moonrise-festival-2019/','sonic-temple-2019/','lollapalooza-chicago-2019/', 'south-by-southwest-sxsw-2019/', 'bonnaroo-music-festival-2019/', 'sweetwater-420-festival-2019/','rolling-loud-festival-2019/', 'governors-ball-music-festival-2019/']

EVENTURLS.each do |festival|
  url = "https://www.musicfestivalwizard.com/#{festival}/"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  event = Event.new
  headerblock = html_doc.search('.headerblock')
  event.name = headerblock.search("h1 a").text #headerblock name 1
  event.start_date = Date.today + rand(1..50)
  event.end_date = event.start_date + 1
  # event.start_date -= 50 if event.end_date < event.start_date
  event.genre = GENRES.sample
  event.partnership = PARTNERSHIPS.sample
  event.type_event = TYPES.sample
  event.location = html_doc.search('.headerblock p').last.text
  # headerblock.search("p").first.text #headerblock name 2
  # not in a parsable format ^
  event.event_description = html_doc.search('.hubscene').text
  # file = html_doc.search('.parallax').first.attributes["data-bg"].value[4..-2]
  # event.photo.attach(io: file, filename: 'file', content_type: 'image/png')
  # ^ works but need to install ActiveStorage first to then attach this image to the event
  event.save!
end

# Package Instances

sickomode = Package.new
sickomode.name = "SICKO Mode"
sickomode.price = 750
sickomode.description = "Dedicated attention for the entire event by one our our professional photographers!"
sickomode.session = "Dedicated session"
sickomode.save!

howdoyouwantit = Package.new
howdoyouwantit.name = "How do you want it?"
howdoyouwantit.price = 400
howdoyouwantit.description = "Book a time slot for 1-2 hours for a dedicated session of high caliber photography!"
howdoyouwantit.session = "Dedicated session"
howdoyouwantit.save!

timezones = Package.new
timezones.name = "Timezones"
timezones.price = 250
timezones.description = "Our team will capture moments throughout your event experience"
timezones.session = "Periodic session"
timezones.save!

# Preference Array
PREFERENCES.each do |pref|
  Shotpreference.create!(name: pref)
end

# Specialty Array

SPECIALTIES.each do |special|
  Specialty.create!(name: special)
end


randomevents = Event.all.sample(3)

randomevents.each do |re|
  availability = Availablephotographer.new(photographer: photographer, event: re, fully_booked: "Partially")
  availability.save!
  # default value is 'FREE' when the photographer's row is created in this table

  booking = Booking.new(photographer: photographer, attendee: attendee, event: re, package: Package.all.sample, start_time: "3:00", end_time: "5:00")
  # if there is 1 value of SICKO Mode in the package: key then we change the value of fully_booked to 'FULL'
  # booking.start_date = Time.new(2020, 4, 12).strftime('%b %d, %Y')
  # booking.end_date = Time.new(2020, 4, 15).strftime('%b %d, %Y')
  booking.save!
end

3.times do
  reviews = Review.new(content: REVIEWS.sample, booking: Booking.all.sample)
  reviews.save!
end

puts "Creating bookings"
