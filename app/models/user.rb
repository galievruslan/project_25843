class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your modelt
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :gender, :birth_date, :city_id, :country_id, :region_id
  belongs_to :city
  belongs_to :country
  belongs_to :region
  validates :username, :gender, :birth_date, :city_id, :country_id, :region_id, :email, :password, :password_confirmation, :presence => true
  validates :username, :uniqueness => { :case_sensitive => false }

end
