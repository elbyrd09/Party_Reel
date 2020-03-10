class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.time :start_time
      t.time :end_time
      t.references :attendee, foreign_key: true
      t.references :photographer, foreign_key: true
      t.references :event, foreign_key: true
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
