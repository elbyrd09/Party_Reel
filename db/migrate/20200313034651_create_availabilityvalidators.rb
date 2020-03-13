class CreateAvailabilityvalidators < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilityvalidators do |t|
      t.string :validate_each

      t.timestamps
    end
  end
end
