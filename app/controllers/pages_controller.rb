# frozen_string_literal: true
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @home_subnavar = true
    @hide_nav = false

    if user_signed_in?
      if current_user.company = nil
        current_user_domain_name = current_user.email.split('@')[1]
        @companies = Company.all
        @companies.each do |company|
          current_user.company = company if current_user_domain_name == company.domain_name
        end
        current_user.save
      end
    end

  end
end
