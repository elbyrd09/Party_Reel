class CreateShotpreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :shotpreferences do |t|
      t.string :name

      t.timestamps
    end
  end
end
