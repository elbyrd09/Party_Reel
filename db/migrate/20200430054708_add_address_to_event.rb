class AddAddressToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :country, :string
  end
end
