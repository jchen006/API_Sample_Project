class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.integer :location_id
      t.string :address

      t.timestamps
    end
  end
end
