class RegistrationsController < Devise::RegistrationsController
  def new
    @genders = ['male', 'female']
    super   
  end

  def create    
    @genders = ['male', 'female']
    super
  end

  def update
    super
  end

  def get_regions
    @regions = Region.where(country_id: params[:country_id]) 
    render :partial => "regions", :object => @regions 
  end
end 