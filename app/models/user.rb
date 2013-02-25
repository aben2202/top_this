class User < ActiveRecord::Base
  #before_save :ensure_authentication_token
  has_attached_file :profile_pic, styles: { small: "100x100>" },
                    url: "/assets/users/:id/:style/:basename.:extension",
                    path: ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_pic, :admin_to
  # attr_accessible :title, :body

  has_many :route_completions, dependent: :destroy
  has_many :betas, dependent: :destroy

  def as_json(options={})
  	super(only: [:id, :email, :first_name, :last_name, :admin_to], methods: [:profile_pic_url])
  end

  def profile_pic_url
    profile_pic.url
  end
end
