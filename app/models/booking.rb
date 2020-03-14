class Booking < ApplicationRecord
  belongs_to :attendee
  belongs_to :photographer
  belongs_to :event
  belongs_to :package

  has_many :reviews
  # has_many :payments
  monetize :amount_cents

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time

  after_save :update_fully_booked

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start time")
    end
  end

  def update_fully_booked
    # counters for the different packages
    timezone_count = 0 # 5 means fully booked
    hdywi_count = 0 # 3 means fully booked
    sicko_count = 0 # 1 means fully booked

    # get the Availablephotographers instance for 1. the photographer who just got booked, and
    # 2. the event he just got booked for
    availability = self.photographer.availablephotographers.where(event: self.event).first

    # Get all the bookings for the photographer for this particular event
    pgr_bookings_this_event = self.photographer.bookings.where(event: self.event)

    # Iterate through all the photographer bookings and count each occurnce of a package
    pgr_bookings_this_event.each do |booking|
      case booking.package.name
      when "Timezones"
        timezone_count += 1
      when "SICKO Mode"
        sicko_count += 1
      when "How do you want it?"
        hdywi_count += 1
      end
    end

    # If there is a SICKO mode booked or there are 5 'Timezones' and 'How do you want it's:
    # availability is 'Full', else it's 'Partially'
    if sicko_count == 1 || timezone_count == 5 || hdywi_count == 3
      availability.fully_booked = "Full"
    else
      availability.fully_booked = "Partially"
    end
    availability.save
  end
end
