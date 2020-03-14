class Photographer < ApplicationRecord
  PROFESSIONS = ["Photographer", "Videographer", "Both"]

  belongs_to :user

  has_one_attached :avatar
  has_many :photographerspecialties
  has_many :availablephotographers
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :phone_number, format: { with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/ }, presence: true
  # no validations for camera and lenses
  validates :profession, inclusion: { in: PROFESSIONS }


  def unavailable_times
    times = bookings.pluck(:start_time)
    times.flatten.map {|time| time.hour }
  end

end
