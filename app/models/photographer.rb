class Photographer < ApplicationRecord
  PROFESSIONS = ["Photographer", "Videographer", "Both"]

  belongs_to :user

  has_many :photographerspecialties
  has_many :availablephotographers
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :phone_number, format: { with: /^[2-9]\d{2}-\d{3}-\d{4}$/ }, presence: true
  # no validations for camera and lenses
  validates :profession, inclusion: { in: PROFESSIONS }

end
