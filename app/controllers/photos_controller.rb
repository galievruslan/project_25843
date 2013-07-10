class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index    
    @user = User.find(params[:user_id])
    @photos = @user.photos.page(params[:page]).per(2)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

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
  def edit
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.create(params[:photo])

  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to user_photo_path(@user, @photo), notice: t(:photo_updated) }
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
    respond_to do |format|
      format.html { redirect_to user_photos_path(@user), notice: t(:photo_destroyed) }
      format.json { head :no_content }
    end
  end
end
