event_time_slots = (1..12).to_a
present_photographers_unavailable_times = [[3,4,5] ,[4,5,6], [1, 4, 57, 8, 10]]
# return list of unavailable time slots
unavailable_times = []
event_time_slots.each do |event_time_slot|
  time_slot_available = []
  present_photographers_unavailable_times.each do |photographer_unavailable_times|
    if !photographer_unavailable_times.include?(event_time_slot)
      time_slot_available << true
    else
      time_slot_available << false
    end
  end
  unavailable_times << event_time_slot if !time_slot_available.include?(true)
end

puts unavailable_times
