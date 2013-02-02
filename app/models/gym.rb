class Gym < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip

  validates_presence_of :name, :city, :state, :street_address, :zip
  validates_numericality_of :zip,   greater_than_or_equal_to: 10000,
  									less_than_or_equal_to: 99999

  def as_json(options={})
  	super(only: [:id, :name, :street_address, :city, :state, :zip])
  end

end
