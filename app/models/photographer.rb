class Photographer < ApplicationRecord
  belongs_to :user

  has_many :photographerspecialties
  has_many :availablephotographers
  has_many :bookings
  has_many :reviews, through: :bookings
end
