class CreateAttendeeshotpreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendeeshotpreferences do |t|
      t.references :attendee, foreign_key: true
      t.references :shotpreference, foreign_key: true

      t.timestamps
    end
  end
end
