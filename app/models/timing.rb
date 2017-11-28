class Timing < ApplicationRecord
  attr_accessor :date
  validates_presence_of :day, :hours, :minutes, :ampm
end
