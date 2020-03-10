class Package < ApplicationRecord
  NAME = ["SICKO Mode", "How do you want it?", "Timezones"]
  PRICE = [750, 400, 250]
  DESCRIPTION = ["SICKO Mode ~ Dedicated attention for the entire event by one our our professional photographers!", "How do you want it? ~ Book a time slot for 1-2 hours for a dedicated session of high caliber photography!", "Timezones ~ Periodic attention where our team will capture moments throughout your event experience"]
  CATEGORY = ["Dedicated session", "Periodic session"]
  has_many :bookings

  validates :category, inclusion: { in: CATEGORY }, presence: true
  validates :price, inclusion: { in: PRICE }, presence: true
  validates :description, inclusion: { in: DESCRIPTION }, presence: true
  validates :name, inclusion: { in: NAME }, presence: true
end
