class Attendee < ApplicationRecord
  INTERACTIONS = ["Behind the scenes", "With our group", "A mix of both"]
  INFLUENCERS = ["I will only use for personal use", "I plan to make a profit from these photos"]

  belongs_to :user

  has_many :attendeeshotpreferences
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :interaction, inclusion: { in: INTERACTIONS }, presence: true
  validates :influencer, inclusion: { in: INFLUENCERS}, presence: true

end
