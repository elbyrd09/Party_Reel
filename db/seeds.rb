require 'nokogiri'
require 'open-uri'

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
PRICES = [75000, 40000, 25000]
DESCRIPTIONS = ["Dedicated attention for the entire day by one our our professional photographers!", "Book a time slot for 1-2 hours for a dedicated session of high caliber photography!", "Periodic attention where our team will capture moments throughout your event experience"]
BULLETS1 = ["Minimum of 15 photographs", "Minimum of 30 photographs", "Minimum of 50 photographs"]
BULLETS2 = ["Periodic shooting throughout the day", "Dedicated attention for 1 hour", "Full day attention with a dedicated photographer"]
BULLETS3 = ["Delivery of photographs near end of event", "Photographs delivered shortly after 1 hour shoot", "Photographs delivered throughout your event"]

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
INFLUENCERS = ["I will only use the photos personally", "I plan to make a profit from these photos"]

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

user_login2 = User.new(password: 'password', email: 'user3@gmail.com')
user_login2.first_name = 'Kevin'
user_login2.last_name = 'Hello'
user_login2.location = 'Here'
user_login2.email = 'user3@gmail.com'
user_login2.user_ig_handle = 'party.here'
user_login2.save!
puts "Created #{user_login2}"
user_login2.save!

user_login3 = User.new(password: 'password', email: 'user4@gmail.com')
user_login3.first_name = 'Daryl'
user_login3.last_name = 'Mushaweh'
user_login3.location = 'Providence'
user_login3.email = 'user4@gmail.com'
user_login3.user_ig_handle = 'party.there'
user_login3.save!
puts "Created #{user_login3}"
user_login3.save!

user_login4 = User.new(password: 'password', email: 'user5@gmail.com')
user_login4.first_name = 'Danny'
user_login4.last_name = 'Brown'
user_login4.location = 'Philadelphia'
user_login4.email = 'user5@gmail.com'
user_login4.user_ig_handle = 'party.everywhere'
user_login4.save!
puts "Created #{user_login4}"
user_login4.save!

user_login5 = User.new(password: 'password', email: 'user6@gmail.com')
user_login5.first_name = 'Kyle'
user_login5.last_name = 'Bluth'
user_login5.location = 'Seal Beach'
user_login5.email = 'user6@gmail.com'
user_login5.user_ig_handle = 'party.overthere'
user_login5.save!
puts "Created #{user_login5}"
user_login5.save!

user_login6 = User.new(password: 'password', email: 'user7@gmail.com')
user_login6.first_name = 'Bryan'
user_login6.last_name = 'Glowik'
user_login6.location = 'Worcester'
user_login6.email = 'user7@gmail.com'
user_login6.user_ig_handle = 'party.somewhere'
user_login6.save!
puts "Created #{user_login6}"
user_login6.save!

photographer6 = Photographer.new(user: user_login6)
photographer6.phone_number = '212-555-2121'
photographer6.camera = 'Canon'
photographer6.lenses = '24-105mm'
# photographer.specialty = 'Urban'
photographer6.profession = 'Photographer'
photographer6.save!

photographer5 = Photographer.new(user: user_login5)
photographer5.phone_number = '212-555-2121'
photographer5.camera = 'Canon'
photographer5.lenses = '24-105mm'
# photographer.specialty = 'Urban'
photographer5.profession = 'Photographer'
photographer5.save!


photographer4 = Photographer.new(user: user_login4)
photographer4.phone_number = '212-555-2121'
photographer4.camera = 'Canon'
photographer4.lenses = '24-105mm'
# photographer.specialty = 'Urban'
photographer4.profession = 'Photographer'
photographer4.save!

photographer3 = Photographer.new(user: user_login3)
photographer3.phone_number = '212-555-2121'
photographer3.camera = 'Canon'
photographer3.lenses = '24-105mm'
# photographer.specialty = 'Urban'
photographer3.profession = 'Photographer'
photographer3.save!

photographer2 = Photographer.new(user: user_login2)
photographer2.phone_number = '322-555-4214'
photographer2.camera = 'Canon'
photographer2.lenses = '34-106mm'
# photographer2.specialty = 'Urban'
photographer2.profession = 'Photographer'
photographer2.save!

photographer = Photographer.new(user: user_login)
photographer.phone_number = '212-555-2121'
photographer.camera = 'Canon'
photographer.lenses = '24-105mm'
# photographer.specialty = 'Urban'
photographer.profession = 'Photographer'
photographer.save!

puts "Created photographers"

puts "Festivals uploading..."
# Event instances

mt_jam = Event.new
mt_jam.name = "Mountain Jam"
mt_jam.start_date = "May 29, 2020"
mt_jam.end_date = "May 31, 2020"
mt_jam.genre = "Rock"
mt_jam.partnership = "No, Party Reel only"
mt_jam.type_event = "Multi-day Festival"
mt_jam.location = "New York"
mt_jam.event_description = "Held in the picturesque Hunter Mountains, Mountain Jam is a three-day rock festival set out to bring rock fans together in upstate New York."
mt_jam.local_img = "mountainJam.jpg"
mt_jam.save!

elec_for = Event.new
elec_for.name = "Electric Forest"
elec_for.start_date = "June 25, 2020"
elec_for.end_date = "June 28, 2020"
elec_for.genre = "EDM"
elec_for.partnership = "No, Party Reel only"
elec_for.type_event = "Multi-day Festival"
elec_for.location = "Michigan"
elec_for.event_description = "Electric Forest has grown into a full-on destination fest. At night, the Sherwood Forest becomes alive with lights, art, and the creativity of the fans."
elec_for.local_img = "electricforest2020.jpg"
elec_for.save!

coachella = Event.new
coachella.name = "Coachella"
coachella.start_date = "October 9, 2020"
coachella.end_date = "October 18, 2020"
coachella.genre = "Mixed"
coachella.partnership = "Yes, food truck: allocate 1 photographer"
coachella.type_event = "Multi-day Festival"
coachella.location = "Palm Springs"
coachella.event_description = "The glitz and glamour of Los Angeles migrates east to the Indio desert for back to back weekends of the biggest names in music. What started as a small electronic festival in the desert has transformed into a cultural touchstone for the festival season."
coachella.local_img = "coachella.png"
coachella.save!

edc = Event.new
edc.name = "Electric Zoo"
edc.start_date = "September 4, 2020"
edc.end_date = "September 6, 2020"
edc.genre = "EDM"
edc.partnership = "No, Party Reel only"
edc.type_event = "Multi-day Festival"
edc.location = "New York City"
edc.event_description = "As the largest and longest-running electronic festival in the city, the park transforms into an electronic playground for a three-day jammed pack festival."
edc.local_img = "e-zoo-2.jpeg"
edc.save!

aftershock = Event.new
aftershock.name = "Aftershock Festival"
aftershock.start_date = "October 9, 2020"
aftershock.end_date = "October 11, 2020"
aftershock.genre = "Rock"
aftershock.partnership = "Yes, food truck: allocate 1 photographer"
aftershock.type_event = "Multi-day Festival"
aftershock.location = "Sacramento"
aftershock.event_description = "With alumni like Megadeth, Korn, Ozzy Osbourne, Nine Inch Nails, Godsmack, Alice in Chains, and System of a Down, this is the place to see genre legends in the western United States along with up-and-comers to the scene."
aftershock.local_img = "aftershock2020.jpg"
aftershock.save!

govball = Event.new
govball.name = "Governors Ball"
govball.start_date = "June 5, 2020"
govball.end_date = "June 7, 2020"
govball.genre = "Mixed"
govball.partnership = "Yes, food truck: allocate 1 photographer"
govball.type_event = "Multi-day Festival"
govball.location = "New York City"
govball.event_description = "Taking place on the Hudson River on Randall’s Island, festival fans can settle back and enjoy the show with the unforgettable NYC skyline as the backdrop."
govball.local_img = "govball.jpg"
govball.save!

puts "Enhance..."
# Package Instances

timezones = Package.new
timezones.name = "Timezones"
timezones.price_cents = 25000
timezones.description = "Our team will capture moments throughout your event experience"
timezones.bullet1 = "Minimum of 15 photographs"
timezones.bullet2 = "Periodic shooting throughout the day"
timezones.bullet3 = "Delivery of photographs near end of event"
timezones.session = "Periodic session"
timezones.local_img = "timezones.jpg"
timezones.save!


howdoyouwantit = Package.new
howdoyouwantit.name = "How do you want it?"
howdoyouwantit.price_cents = 40000
howdoyouwantit.description = "Book a time slot for 1-2 hours for a dedicated session of high caliber photography!"
howdoyouwantit.bullet1 = "Minimum of 30 photographs"
howdoyouwantit.bullet2 = "Dedicated attention for 1 hour"
howdoyouwantit.bullet3 = "Photographs delivered shortly after 1 hour shoot"
howdoyouwantit.session = "Dedicated session"
howdoyouwantit.local_img = "hdywi.jpg"
howdoyouwantit.save!


sickomode = Package.new
sickomode.name = "SICKO Mode"
sickomode.price_cents = 75000
sickomode.description = "Dedicated attention for the entire day by one our our professional photographers!"
sickomode.bullet1 = "Minimum of 50 photographs"
sickomode.bullet2 = "Full day attention with a dedicated photographer"
sickomode.bullet3 = "Photographs delivered throughout your event"
sickomode.session = "Dedicated session"
sickomode.local_img = "sicko.jpg"
sickomode.save!
# Preference Array
PREFERENCES.each do |pref|
  Shotpreference.create!(name: pref)
end

# Specialty Array

SPECIALTIES.each do |special|
  Specialty.create!(name: special)
end

Photographer.all.each do |photographer|

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
end

3.times do
  reviews = Review.new(content: REVIEWS.sample, booking: Booking.all.sample)
  reviews.save!
end

puts "Great success!!"

# EVENTURLS = ['governors-ball-music-festival-2019/', 'mountain-jam-2019/', 'electric-zoo-2019/', 'electric-forest-2019/', 'coachella-music-festival-2019/', 'aftershock-festival-2019/']

# EVENTURLS.each do |festival|
#   url = "https://www.musicfestivalwizard.com/#{festival}/"

#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)
#   event = Event.new
#   headerblock = html_doc.search('.headerblock')
#   event.name = headerblock.search("h1 a").text #headerblock name 1
#   event.start_date = Date.today + rand(1..50)
#   event.end_date = event.start_date + 1
#   # event.start_date -= 50 if event.end_date < event.start_date
#   event.genre = GENRES.sample
#   event.partnership = PARTNERSHIPS.sample
#   event.type_event = TYPES.sample
#   event.location = html_doc.search('.headerblock p').last.text
#   # headerblock.search("p").first.text #headerblock name 2
#   # not in a parsable format ^
#   event.event_description = html_doc.search('.hubscene').text
#   file = URI.open html_doc.search('.parallax').first.attributes["data-bg"].value[4..-2]
#   event.photos.attach(io: file, content_type: 'image/png', filename: "hahaha.png")
#   # ^ works but need to install ActiveStorage first to then attach this image to the event
#   event.save!
# end
