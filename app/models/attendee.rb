class Attendee < ApplicationRecord
  INTERACTIONS = ["Behind the scenes", "With our group", "A mix of both"]

  belongs_to :user

  has_many :attendeeshotpreferences
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :interaction, inclusion: { in: INTERACTIONS }, presence: true
  validates :influencer, presence: true

end
