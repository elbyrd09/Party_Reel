class Package < ApplicationRecord
  NAMES = ["SICKO Mode", "How do you want it?", "Timezones"]
  PRICES = [750, 400, 250]
  DESCRIPTIONS = ["Dedicated attention for the entire event by one our our professional photographers!", "Book a time slot for 1-2 hours for a dedicated session of high caliber photography!", "Our team will capture moments throughout your event experience"]
  SESSIONS = ["Dedicated session", "Periodic session"]
  has_many :bookings

  validates :session, inclusion: { in: SESSIONS }, presence: true
  validates :price, inclusion: { in: PRICES }, presence: true
  validates :description, inclusion: { in: DESCRIPTIONS }, presence: true
  validates :name, inclusion: { in: NAMES }, presence: true
end
