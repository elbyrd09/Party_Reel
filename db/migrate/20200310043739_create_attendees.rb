class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.string :interaction
      t.string :influencer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
