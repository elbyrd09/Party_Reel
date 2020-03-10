class CreatePhotographerspecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :photographerspecialties do |t|
      t.references :specialty, foreign_key: true
      t.references :photographer, foreign_key: true

      t.timestamps
    end
  end
end
