class Event < ApplicationRecord
  geocoded_by :address
  before_save :geocode, if: ->(obj){ !obj.address.nil? }

  def address
    [city, state, country].compact.join(', ')
  end



  TYPES = ["Multi-day Festival", "Single-day Festival", "Concert"]
  GENRES = ["Hip Hop", "Rock", "Metal", "EDM", "Mixed", "Folk", "Bluegrass", "Jazz", "Reggae", "Punk", "Alternative", "K-Pop", "Country"]
  PARTNERSHIPS = ["Yes, food truck: allocate 1 photographer", "Yes, Radiate: allocate 2 photographers", "No, Party Reel only"]

  include PgSearch::Model

  pg_search_scope :search_by_location_and_name_and_genre,
      against: [ :location, :name, :genre ],
      using: {
        tsearch: { prefix: true, dictionary: 'english' }
        }
  has_many :availablephotographers
  has_many :bookings

  validates :name, presence: true

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true

  validates :event_description, presence: true
  validates :location, presence: true
  validates :type_event, inclusion: { in: TYPES }, presence: true
  validates :genre, inclusion: { in: GENRES }, presence: true
  validates :partnership, inclusion: { in: PARTNERSHIPS }



  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
