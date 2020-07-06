class Event < ApplicationRecord
  geocoded_by :address
  before_save :geocode, if: ->(obj){ !obj.address.nil? }

  def address
    [city, state, country].compact.join(', ')
  end

  def priority
    nearest_event = Event.nearest
    if events_today.include?(Event.nearest)
      return nearest_event
    else
      return event_nearest(events_today)
    end
   end

  def nearest
    @events = Event.all
      # gets user ip address
    return event_nearest(@events)
  end

  def event_nearest(event_array)
    user_ip_address = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
    # uses geocoder to convert ip address to coordinates
    if !user_ip_address.nil?
      user_location = Geocoder.search(user_ip_address)[0].data['loc']
      distance_event_hash = {}
      # earliest_start_hash = {}
      @smallest_distance = 100000
      # hash of distance => event
      event_array.each do |event|
        distance = event.distance_from(user_location)
        distance_event_hash[distance] = event
        @smallest_distance = distance if distance < @smallest_distance
      end
        @nearest_event = distance_event_hash[@smallest_distance]
      else
        # in the (un)likely case we can't retrieve the users IP
        @nearest_event = event_array[rand(1..event_array.length)]
        @smallest_distance = nil
      end
    end

    def todays_events
      events_today = Event.where('start_date = ?', DateTime.now)
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
