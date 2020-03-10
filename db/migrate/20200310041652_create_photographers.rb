class CreatePhotographers < ActiveRecord::Migration[5.2]
  def change
    create_table :photographers do |t|
      t.string :phone_number
      t.string :camera
      t.string :lenses
      t.string :specialty
      t.string :profession
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
