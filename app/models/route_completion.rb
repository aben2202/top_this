class RouteCompletion < ActiveRecord::Base
  attr_accessible :climb_type, :completion_date, :completion_type

  has_one :route
  has_one :user
  
end
