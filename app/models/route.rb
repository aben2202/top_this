class Route < ActiveRecord::Base
  attr_accessible :name, :rating, :retirement_date, :gym_id, :location, :setter, :route_type, :set_date

  validates_presence_of :name, :rating

  has_many :route_completions, dependent: :destroy
  has_many :betas, dependent: :destroy

  belongs_to :gym

  def as_json(options={})
  	super(only: [:id, :gym_id, :name, :rating, :created_at, :retirement_date, :location, :setter, :route_type, :set_date],
  		  include: {:route_completions => {only: [:id, :climb_type, :completion_date, :completion_type, :send_date, :created_at, :updated_at]}})
  end

end