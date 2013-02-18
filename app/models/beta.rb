class Beta < ActiveRecord::Base
  attr_accessible :comment, :route_id, :user_id

  belongs_to :route
  belongs_to :user 

  validates_presence_of :comment, :route_id, :user_id, :date

  def as_json(options={})
  	super(only: [:id, :comment, :date],
  		  include: {user: {only: [:id, :email, :first_name, :last_name, :admin_to], methods: [:profile_pic_url]},
  		  			route: {only: [:id, :gym_id, :name, :rating, :set_date, :retirement_date]}})
  end

  private
  	def profile_pic_url
  		self.user.profile_pic.url(:small)
  	end
end
