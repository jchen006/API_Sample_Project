class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :types, :places

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
