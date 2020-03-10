class Event < ApplicationRecord
  has_many :availablephotographers
  has_many :bookings
end
