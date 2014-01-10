class AddTypesToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :types, :string
  end
end
