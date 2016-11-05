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

  def update
    current_user.update(user_params)
    current_user.save
    redirect_to profile_path(current_user)
  end

  def adding_company_to_user_profile_at_creation
    domain_name = current_user.email.split('@')[1]
    @companies = Company.all
    @companies.each do |company|
      user.company_id = company.id if domain_name == company.domain_name
    end
  end

  def sending_approval_pending_notification
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_picture, :profile_picture_cache)
  end
end
