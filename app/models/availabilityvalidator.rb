# class Availabilityvalidator < ApplicationRecord
#   def validate_each(record, time, value)
#     bookings = Booking.where(["photographer_id =?", record.photographer_id])
#     time_ranges = bookings.map { |b| b.start_time..b.end_time }
#     time_ranges.each do |range|
#       if range.include? value
#         record.errors.add(time, "not available")
#       end
#     end
#   end
# end
# end
