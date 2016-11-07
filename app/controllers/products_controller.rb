# frozen_string_literal: true
class ProductsController < ApplicationController
  def index
    @display_subnavbar = true
    @tab = 'product_index'
    client = DataApiClient.new
    @items = client.call_all_items
  end

  def show
    @display_subnavbar = true
    client = DataApiClient.new
    @item = client.call_one_item(params[:id])
  end
end
