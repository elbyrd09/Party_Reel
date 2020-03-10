class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :category
      t.integer :price
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
