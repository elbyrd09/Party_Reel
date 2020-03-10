class Attendeeshotpreference < ApplicationRecord
  belongs_to :attendee
  belongs_to :shotpreference
end
