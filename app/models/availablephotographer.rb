class Availablephotographer < ApplicationRecord
  FULLYBOOK = ["Free", "Full", "Partially"]
  belongs_to :event
  belongs_to :photographer

  validates :fully_booked, inclusion: { in: FULLYBOOK }
end
