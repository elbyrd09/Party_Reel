class AddAmountToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :amount_cents, :integer, default: 0, null: false
  end
end
