class Event < ApplicationRecord
  has_many :availablephotographers
  has_many :bookings

  validates :name, presence: true
  validates :influencer, presence: true

end
