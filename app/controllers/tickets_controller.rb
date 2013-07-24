class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new
    @genders = ['male', 'female'] 
    @countries = Country.all(order: 'name')
    @regions = []
    @cities = []
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    @countries = Country.all(order: 'name')
    if @ticket.q_country_id
      @regions = Country.find(@ticket.q_country_id).regions
    else
      @regions = []
    end    
    if @ticket.q_region_id
      @cities = Region.find(@ticket.q_region_id).cities
    else
      @cities = []
    end
    @genders = ['male', 'female'] 
  end

  # POST /tickets
  # POST /tickets.json
  def create  
    @countries = Country.all(order: 'name')
    if !params[:ticket][:q_country_id].empty?
      @regions = Country.find(params[:ticket][:q_country_id]).regions
    else
      @regions = []
    end    
    if !params[:ticket][:q_region_id].empty?
      @cities = Region.find(params[:ticket][:q_region_id]).cities
    else
      @cities = []
    end
    @ticket = Ticket.new(params[:ticket])
    @ticket.user = current_user
    @ticket.country = current_user.country
    @ticket.region = current_user.region
    @ticket.city = current_user.city
    @ticket.age = current_user.age
    @ticket.gender = current_user.gender

    @genders = ['male', 'female'] 
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: t(:ticket_created) }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @countries = Country.all(order: 'name')
    if !params[:ticket][:q_country_id].empty?
      @regions = Country.find(params[:ticket][:q_country_id]).regions
    else
      @regions = []
    end    
    if !params[:ticket][:q_region_id].empty?
      @cities = Region.find(params[:ticket][:q_region_id]).cities
    else
      @cities = []
    end
    @ticket = Ticket.find(params[:id])
    @ticket.user = current_user
    @ticket.country = current_user.country
    @ticket.region = current_user.region
    @ticket.city = current_user.city
    @ticket.age = current_user.age
    @ticket.gender = current_user.gender
    @ticket.save
    @genders = ['male', 'female'] 
    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: t(:ticket_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: t(:ticket_destroyed)  }
      format.json { head :no_content }
    end
  end
end
