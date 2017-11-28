class Provider < ApplicationRecord
  self.table_name = "providers"
  validates_presence_of :provider
end
