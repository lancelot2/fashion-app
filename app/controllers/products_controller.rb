class ProductsController < ApplicationController
  def index
    @show_nav = true

    client = DataApiClient.new
    @items = client.call_all_items

    # @search = Search.new(search_params)
    # @search.save
    # redirect_to searches_path
    # @tab = 'product_index'

    # require 'json'
    # filepath = 'beers.json'
    # serialized_products = File.read(filepath)
    # products = JSON.parse(serialized_products)
  end

  def show

  end
end
