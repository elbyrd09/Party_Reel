class AddImageUrlToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :local_img, :string
  end
end
