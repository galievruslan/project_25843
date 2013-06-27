class City < ActiveRecord::Base
	attr_accessible :name, :latitude, :longitude, :timezone, :dma_id, :code, :country, :country_id, :region, :region_id
	has_many :users
	belongs_to :region
	belongs_to :country
end