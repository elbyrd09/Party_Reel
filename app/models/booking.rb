class Booking < ApplicationRecord
  belongs_to :attendee
  belongs_to :photographer
  belongs_to :event
  belongs_to :package

  has_one :review
  # has_many :payments
end
