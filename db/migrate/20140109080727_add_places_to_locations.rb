class AddPlacesToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :places, :string
  end
end
