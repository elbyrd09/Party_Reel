require 'nokogiri'
require 'open-uri'
require 'pry-byebug'

Event.destroy_all
Review.destroy_all
User.destroy_all
Photographer.destroy_all
Attendee.destroy_all
Package.destroy_all
Booking.destroy_all
Availability.destroy_all
Preference.destroy_all

# # # Packages
CATEGORIES = ["SICKO Mode", "How do you want it?", "Timezones"]
PRICES = [750, 400, 250]
DESCRIPTIONS = ["SICKO Mode ~ Dedicated attention for the entire event by one our our professional photographers!", "How do you want it? ~ Book a time slot for 1-2 hours for a dedicated session of high caliber photography!", "Timezones ~ Periodic attention where our team will capture moments throughout your event experience"]
SESSIONS = ["Dedicated session", "Periodic session"]

# # # Preferences
PREFERENCES = ["Candid", "Portrait", "Group", "Creative Shots", "Art Installations", "Venue/Artists" ]

# # # Events
TYPES = ["Multi-day Festival", "Single-day Festival", "Concert"]
PARTNERSHIPS = ["Yes, food truck: allocate 1 photographer", "Yes, Radiate: allocate 2 photographers", "No, Party Reel only"]
GENRES = ["Hip Hop", "Rock", "Metal", "EDM", "Mixed", "Folk", "Bluegrass", "Jazz", "Reggae", "Punk", "Alternative", "K-Pop", "Country"]

# # # AvailablePhotographers
FULLYBOOK = ["Free", "Full", "Partially"]

# # # Photographers
SPECIALTIES = ["Urban", "Fashion", "Action", "Nature", "Landscape", "Food"]
PROFESSIONS = ["Photographer", "Videographer", "Both"]

# # # Attendee
INTERACTIONS = ["Behind the Scenes", "With our Group", "A Mix of Both"]

# # UserAttendee
user_login = User.new(password: 'password', email: 'user1@gmail.com')
user_login.first_name = 'John'
user_login.last_name = 'Denver'
user_login.location = 'Denver'
user_login.email = 'user1@gmail.com'
user_login.instagram = 'party.reel'
user_login.
user_login.save!
puts "Created #{user_login}"
user_login.save!

attendee = Attendee.new(user: user_login)
attendee.interaction = 'Behind the Scenes'
attendee.influencer = 'Yes'
attendee.save!
puts "Created #{attendee}"

# # UserPhotographer

user_login = User.new(password: 'password', email: 'user2@gmail.com')
user_login.first_name = 'Joe'
user_login.last_name = 'Dimagio'
user_login.location = 'Brooklyn'
user_login.email = 'user2@gmail.com'
user_login.instagram = 'party.brooklyn'
user_login.
user_login.save!
puts "Created #{user_login}"
user_login.save!

photographer = Photographer.new(user: user_login)
photographer.phone_number = '212-555-2121'
photographer.camera = 'Canon'
photographer.lenses = '24-105mm'
photographer.specialty = 'Urban'
photographer.preferences = 'Photographer'
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
  event.start_date = Date.today + rand(1..200)
  event.end_date = Date.today + rand(50..265)
  event.start_date -= 50 if event.end_date < event.start_date
  event.genre = GENRES.sample
  event.partnership = PARTNERSHIPS.sample
  # headerblock.search("p").first.text #headerblock name 2
  # not in a parsable format ^
  event.location = headerblock.search("p").last.text #headerblock date
  event.event_description = html_doc.search('.hubscene').text
  # html_doc.search('.parallax').first.attributes["data-bg"].value[4..-2]
  # ^ works but need to install ActiveStorage first to then attach this image to the event
  event.save!
endX

3.times do
  booking = Booking.new(photographer: photographer, attendee: attendee, event: event, package: package)
  booking.start_time = Time.new(2020, 4, 12).strftime('%b %d, %Y')
  booking.end_time = Time.new(2020, 4, 15).strftime('%b %d, %Y')
  booking.save!
end

puts "Creating bookings"
