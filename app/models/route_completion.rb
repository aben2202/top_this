class RouteCompletion < ActiveRecord::Base
  attr_accessible :climb_type, :completion_date, :completion_type, :user_id, :route_id

  belongs_to :route
  belongs_to :user

  def as_json(options={})
  	super(only: [:id, :climb_type, :completions_date, :completion_type],
  		  include: [:route, :user])
  end

end
