class RegionsController < ApplicationController
  def index
		@regions = Region.where(country_id: params[:country_id])
		respond_to do |format|
			format.json { render :json => @regions }
		end		
  end
end
