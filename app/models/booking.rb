class Booking < ApplicationRecord
  belongs_to :attendee
  belongs_to :photographer
  belongs_to :event
  belongs_to :package

  has_one :review
  # has_many :payments

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :end_time_after_start_time

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
end
