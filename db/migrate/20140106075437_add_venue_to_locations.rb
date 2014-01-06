class AddVenueToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :venue, :string
  end
end
