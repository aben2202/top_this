class Route < ActiveRecord::Base
  attr_accessible :name, :rating, :retirement_date, :set_date, :gym_id

  validates_presence_of :name, :rating, :set_date

  has_many :route_completions

end
