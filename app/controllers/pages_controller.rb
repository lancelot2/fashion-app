class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @disable_nav = true
  end

  def product_index
    # @search = Search.new(search_params)
    # @search.save
    # redirect_to searches_path
  end
end
