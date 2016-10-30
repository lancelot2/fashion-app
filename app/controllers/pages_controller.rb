class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def product_index
    @show_nav = true
    # @search = Search.new(search_params)
    # @search.save
    # redirect_to searches_path
    @tab = "product_index"



    # require 'json'
    # filepath = 'beers.json'
    # serialized_products = File.read(filepath)
    # products = JSON.parse(serialized_products)


  end
end
