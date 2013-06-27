class CitiesController < ApplicationController
  def index
		@cities = City.where(region_id: params[:region_id], country_id: params[:country_id])
		respond_to do |format|
			format.json { render :json => @cities }
		end		
  end
end