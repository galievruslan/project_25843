class Region < ActiveRecord::Base
	attr_accessible :name, :code, :adm1code, :country, :country_id
	belongs_to :country
	has_many :users
	has_many :cities, :dependent => :destroy
	has_many :tickets, :dependent => :destroy
end