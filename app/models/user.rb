class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your modelt
  attr_accessible :avatar, :email, :password, :password_confirmation, :remember_me, :username, :gender, :birth_date, :city_id, :country_id, :region_id, :city, :country, :region
  mount_uploader :avatar, PhotoUploader
  belongs_to :city
  belongs_to :country
  belongs_to :region
  has_many :photos, :dependent => :destroy
  validates :username, :gender, :birth_date, :city_id, :country_id, :region_id, :email, :presence => true
  validates :username, :uniqueness => { :case_sensitive => false }
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
end
