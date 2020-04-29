class Attendee < ApplicationRecord
  INTERACTIONS = ["Behind the scenes", "With our group", "A mix of both"]
  INFLUENCERS = ["I will only use the photos personally", "I plan to make a profit from these photos"]

  belongs_to :user

  has_many :attendeeshotpreferences
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :interaction, inclusion: { in: INTERACTIONS }, presence: true

  validates :influencer, presence: true

end
