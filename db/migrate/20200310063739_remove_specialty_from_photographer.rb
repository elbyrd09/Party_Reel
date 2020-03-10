class RemoveSpecialtyFromPhotographer < ActiveRecord::Migration[5.2]
  def change
    remove_column :photographers, :specialty, :string
  end
end
