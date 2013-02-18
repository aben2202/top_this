class RouteCompletion < ActiveRecord::Base
  attr_accessible :climb_type, :completion_date, :completion_type, :user_id, :route_id

  belongs_to :route
  belongs_to :user

  def as_json(options={})
  	super(only: [:id, :climb_type, :completion_date, :completion_type],
  		  include: {:route => {only: [:id, :gym_id, :name, :rating, :set_date, :retirement_date]},
  		  		    :user => {only: [:id, :email, :first_name, :last_name], methods: [:profile_pic_url]}})
  end

  def profile_pic_url
  	self.user.profile_pic.url(:small)
  end
end
