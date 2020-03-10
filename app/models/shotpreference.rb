class Shotpreference < ApplicationRecord
  TYPES = ["Candid", "Portrait", "Group", "Creative Shots", "Art Installations", "Venue/Artists" ]
  has_many :attendeeshotpreferences

  validates :name, inclusion: { in: TYPES }, presence: true
end
