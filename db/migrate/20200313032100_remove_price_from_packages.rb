class RemovePriceFromPackages < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :price
  end
end
