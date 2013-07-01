class Photo < ActiveRecord::Base
	include Rails.application.routes.url_helpers
  attr_accessible :comment, :file, :user_id, :user
  validates :user_id, :file, :presence => true 
  belongs_to :user
  mount_uploader :file, PhotoUploader
end
