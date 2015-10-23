class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_user, :check_correct_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated Successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end	

  private

    def user_params
      params.require(:user).permit(:phone, :state_id, :city_id, :interested_in, :prefered_language)
    end

    def set_user
      @user = User.find(params[:id])
    end	

    def check_correct_user
      if current_user != @user
        flash[:error] = "You not authorized to perform this action"
        redirect_to root_url
        return
      end 	
    end	
end
