class Specialty < ApplicationRecord
  SPECIALTIES = ["Urban", "Fashion", "Action", "Nature", "Landscape", "Food"]
  has_many :photographerspecialties

  validates :name, inclusion: { in: SPECIALTIES }, presence: true

end
