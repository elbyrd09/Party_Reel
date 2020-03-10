class Specialty < ApplicationRecord
  SPECIALTY = ["Urban", "Fashion", "Action", "Nature", "Landscape", "Food"]
  has_many :photographerspecialties

  validates :name, inclusion: { in: SPECIALTY }, presence: true

end
