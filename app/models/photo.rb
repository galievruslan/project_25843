class Photo < ActiveRecord::Base
	include Rails.application.routes.url_helpers
  attr_accessible :comment, :file, :user_id, :user
  validates :user_id, :file, :presence => true 
  belongs_to :user
  mount_uploader :file, PhotoUploader

  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "thumbnail_url" => file.thumb.url,	
      "delete_url" => user_photo_path(:user_id => user_id, :id => id),
      "delete_type" => "DELETE" 
    }
  end
end
