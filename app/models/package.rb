class Package < ApplicationRecord
  NAMES = ["SICKO Mode", "How do you want it?", "Timezones"]
  PRICES = [75000, 40000, 25000]
  DESCRIPTIONS = ["Dedicated attention for the entire event by one our our professional photographers!", "Book a time slot for 1-2 hours for a dedicated session of high caliber photography!", "Our team will capture moments throughout your event experience"]
  SESSIONS = ["Dedicated session", "Periodic session"]
  has_many :bookings

  monetize :price_cents

  validates :session, inclusion: { in: SESSIONS }, presence: true
  validates :price_cents, inclusion: { in: PRICES }, presence: true
  validates :description, inclusion: { in: DESCRIPTIONS }, presence: true
  validates :name, inclusion: { in: NAMES }, presence: true
end
