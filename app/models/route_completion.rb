class RouteCompletion < ActiveRecord::Base
  attr_accessible :climb_type, :completion_date, :completion_type, :user_id, :route_id, :send_date

  belongs_to :route
  belongs_to :user

  validates_uniqueness_of :user_id, scope: [:climb_type, :route_id]

  def as_json(options={})
  	super(only: [:id, :climb_type, :completion_date, :completion_type, :send_date, :created_at, :updated_at],
  		  include: {:route => {only: [:id, :gym_id, :name, :rating, :created_at, :retirement_date, :location, :setter, :route_type]},
  		  		    :user => {only: [:id, :email, :first_name, :last_name], methods: [:profile_pic_url]}})
  end

  def profile_pic_url
  	self.user.profile_pic.url(:small)
  end
end
