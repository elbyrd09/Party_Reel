class Shotpreference < ApplicationRecord
  PREFERENCES = ["Candid", "Portrait", "Group", "Creative Shots", "Art Installations", "Venue/Artists" ]
  has_many :attendeeshotpreferences

  validates :name, inclusion: { in: PREFERENCES }, presence: true
end
