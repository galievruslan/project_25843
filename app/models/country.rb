class Country < ActiveRecord::Base
	attr_accessible :name, :fips104, :iso2, :iso3, :ison, :internet, :capital, :map_reference, :nationality_singular,
	 :nationaiity_plural, :currency, :currency_code, :population, :title, :comment
	has_many :users
	has_many :tickets, :dependent => :destroy
	has_many :cities, :dependent => :destroy
	has_many :regions, :dependent => :destroy
end