class User < ActiveRecord::Base
  #before_save :ensure_authentication_token

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessible :title, :body

  has_many :route_completions

  def as_json(options={})
  	super(only: [:id, :email, :first_name, :last_name, :admin_to])
  end
end
