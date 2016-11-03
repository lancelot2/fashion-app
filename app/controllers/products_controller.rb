class ProductsController < ApplicationController
  def index
    @tab = 'product_index'
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
    client = DataApiClient.new
    @item = client.call_one_item(params[:id])
  end
end
