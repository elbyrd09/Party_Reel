class RemoveUserProfileImgFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_profile_img, :string
  end
end
