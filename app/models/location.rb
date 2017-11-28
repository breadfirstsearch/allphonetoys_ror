class Location < ApplicationRecord
  self.table_name = "locations"
  validates_presence_of :location
end
