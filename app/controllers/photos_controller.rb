class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index    
    @user = User.find(params[:user_id])
    @photos = @user.photos
    render :json => @photos.collect { |p| p.to_jq_upload }.to_json
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @photos }
    # end
  end

  # GET /photos/1
  # GET /photos/1.json
  # def show
  #   @user = User.find(params[:user_id])
  #   @photo = Photo.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @photo }
  #   end
  # end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @user = User.find(params[:user_id])
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  # def edit
  #   @user = User.find(params[:user_id])
  #   @photo = Photo.find(params[:id])
  # end

  # POST /photos
  # POST /photos.json
  def create
    @user = User.find(params[:user_id])
    # @photo = @user.photos.new(params[:photo])

    p_attr = params[:photo]
    p_attr[:file] = params[:photo][:file].first if params[:photo][:file].class == Array
    @photo = @user.photos.new(p_attr)
    
    if @photo.save
      respond_to do |format|
        format.html {  
          render :json => [@photo.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => { :files => [@photo.to_jq_upload] }     
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end

    # respond_to do |format|
    #   if @photo.save
    #     format.html { redirect_to user_photo_path(@user, @photo), notice: 'Photo was successfully created.' }
    #     format.json { render json: @photo, status: :created, location: @photo }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @photo.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to user_photo_path(@user, @photo), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    render :json => true
    # respond_to do |format|
    #   format.html { redirect_to user_photos_path(@user) }
    #   format.json { head :no_content }
    # end
  end
end
