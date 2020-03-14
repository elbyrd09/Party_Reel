class AddPriceToPackages < ActiveRecord::Migration[5.2]
  def change
    add_monetize :packages, :price, currency: { present: false }
  end
end
