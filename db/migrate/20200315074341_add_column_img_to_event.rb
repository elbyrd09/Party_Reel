class AddColumnImgToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :local_img, :string
  end
end
