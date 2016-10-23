class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    current_user.update(user_params)
    current_user.save
    redirect_to profile_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_picture)
  end
end
