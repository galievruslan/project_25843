class Region < ActiveRecord::Base
	attr_accessible :name, :code, :adm1code, :country, :country_id
	belongs_to :country
	has_many :cities, :dependent => :destroy
end