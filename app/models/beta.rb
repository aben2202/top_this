class Beta < ActiveRecord::Base
  attr_accessible :comment, :route_id, :user_id, :beta_type, :beta_answered

  belongs_to :route
  belongs_to :user 

  validates_presence_of :comment, :route_id, :user_id, :beta_type

  def as_json(options={})
  	super(only: [:id, :comment, :beta_type, :beta_answered, :created_at],
  		  include: {user: {only: [:id, :email, :first_name, :last_name, :admin_to], methods: [:profile_pic_url]},
  		  			route: {only: [:id, :gym_id, :name, :rating, :created_at, :retirement_date, :location, :setter, :route_type]}})
  end

  private
  	def profile_pic_url
  		self.user.profile_pic.url(:small)
  	end
end
