class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :event_description
      t.string :location
      t.string :type_event
      t.string :genre
      t.string :partnership

      t.timestamps
    end
  end
end
