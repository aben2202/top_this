class Route < ActiveRecord::Base
  attr_accessible :name, :rating, :retirement_date, :set_date

  validates_presence_of :name, :rating, :set_date
end
