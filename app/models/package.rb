class Package < ApplicationRecord
  NAMES = ["Timezones", "How do you want it?", "SICKO Mode" ]
  PRICES = [ 25000, 40000, 75000]
  DESCRIPTIONS = ["Our team will capture moments throughout your event experience", "Book a time slot for 1-2 hours for a dedicated session of high caliber photography!", "Dedicated attention for the entire day by one our our professional photographers!"]
  SESSIONS = ["Dedicated session", "Periodic session"]
  BULLETS1 = ["Minimum of 15 photographs", "Minimum of 30 photographs", "Minimum of 50 photographs"]
  BULLETS2 = ["Periodic shooting throughout the day", "Dedicated attention for 1 hour", "Full day attention with a dedicated photographer"]
  BULLETS3 = ["Delivery of photographs near end of event", "Photographs delivered shortly after 1 hour shoot", "Photographs delivered throughout your event"]

  has_many :bookings
  has_one_attached :photo


  monetize :price_cents

  validates :session, inclusion: { in: SESSIONS }, presence: true
  validates :price_cents, inclusion: { in: PRICES }, presence: true
  validates :description, inclusion: { in: DESCRIPTIONS }, presence: true
  validates :name, inclusion: { in: NAMES }, presence: true
end
