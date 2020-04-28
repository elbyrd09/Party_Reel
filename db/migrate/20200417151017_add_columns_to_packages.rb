class AddColumnsToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :bullet1, :string
    add_column :packages, :bullet2, :string
    add_column :packages, :bullet3, :string
  end
end
