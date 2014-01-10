class Places < ActiveRecord::Base
  attr_accessible :address, :location_id, :name
end
