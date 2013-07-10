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
		respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: t(:user_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
