class AddColumsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :user_ig_handle, :string
    add_column :users, :user_profile_img, :string
  end
end
