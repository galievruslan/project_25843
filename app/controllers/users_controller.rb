class UsersController < ApplicationController

	# GET /users/:id
  def show
  	@user = User.find(params[:id])
  	respond_to do |format|
			format.html			
		end	
  end

  # GET /users/:id/edit
  def edit
		@user = current_user
		@genders = ['male', 'female'] 
  end

  # POST /users/:id
  def update
  	@user = User.find(current_user.id)
		@genders = ['male', 'female'] 		
    if @user.update_attributes(params[:user])
      if params[:user][:avatar].present?
        render :crop
      else
        redirect_to @user, notice: t(:user_updated)
      end
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end    
  end

  # GET /users/:id/password
  def edit_password
    @user = User.find(current_user.id)
  end

  # POST /users/:id/password
  def update_password
    @user = User.find(current_user.id)    
    respond_to do |format|
      if @user.update_with_password(params[:user])
        sign_in @user, :bypass => true
        format.html { redirect_to @user, notice: t(:password_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit_password" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
