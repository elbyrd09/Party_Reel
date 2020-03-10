class ChangeAttendeeInfluencerToBoolean < ActiveRecord::Migration[5.2]
  def change
     change_column :attendees, :influencer, "boolean USING influencer::boolean"
  end
end
