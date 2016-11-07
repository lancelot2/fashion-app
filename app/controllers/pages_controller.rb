# frozen_string_literal: true
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @hide_nav = true
  end

  def home2
    @hide_nav = true
  end
end
