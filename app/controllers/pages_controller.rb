# frozen_string_literal: true
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @home_subnavar = true
    @hide_nav = false
  end

end
