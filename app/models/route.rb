class Route < ActiveRecord::Base
  attr_accessible :name, :rating, :retirement_date, :set_date, :gym_id, :location, :setter

  validates_presence_of :name, :rating, :set_date

  has_many :route_completions, dependent: :destroy
  has_many :betas, dependent: :destroy

  def as_json(options={})
  	super(only: [:id, :gym_id, :name, :rating, :set_date, :retirement_date],
  		  include: {:route_completions => {only: [:id, :climb_type, :completions_date, :completion_type]}})
  end

end
