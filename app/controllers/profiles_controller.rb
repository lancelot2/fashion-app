# frozen_string_literal: true
class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def company_index
    @company_users = User.find(:all, conditions: { company_id: current_user.company_id })
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def validate
     @user = User.find(params[:id])
     @user.access_validated = true
     @user.save
     redirect_to :back
  end

  def freeze
     @user = User.find(params[:id])
     @user.access_validated = false
     @user.save
     redirect_to :back
  end

  def upgrade
     @user = User.find(params[:id])
     @user.access_level = 2
     @user.save
     redirect_to :back
  end

  def downgrade
     @user = User.find(params[:id])
     @user.access_level = 1
     @user.save
     redirect_to :back
  end

  def update
    current_user.update(user_params)
    current_user.save
    redirect_to profile_path(current_user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :back
  end

  def sending_approval_pending_notification
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_picture, :profile_picture_cache)
  end
end
