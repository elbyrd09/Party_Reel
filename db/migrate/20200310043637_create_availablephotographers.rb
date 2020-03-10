class CreateAvailablephotographers < ActiveRecord::Migration[5.2]
  def change
    create_table :availablephotographers do |t|
      t.string :fully_booked
      t.references :event, foreign_key: true
      t.references :photographer, foreign_key: true

      t.timestamps
    end
  end
end
