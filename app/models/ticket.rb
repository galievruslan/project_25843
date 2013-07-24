class Ticket < ActiveRecord::Base
  attr_accessible :age, :city_id, :country_id, :gender, :q_age_from, :q_age_to, :q_city_id, :q_country_id, :q_gender, :q_region_id, :region_id, :user_id, :user, :country, :region, :city
  validates :age, :city_id, :country_id, :gender, :user_id, :q_age_from, :q_age_to, :q_gender, :presence => true
  belongs_to :user
  belongs_to :city
  belongs_to :country
  belongs_to :region
  validates :q_age_from, :numericality => {:greater_than_or_equal_to => 18 }
  validates :q_age_to, :numericality => {:less_than_or_equal_to  => 70 }
end
