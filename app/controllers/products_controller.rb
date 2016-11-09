# frozen_string_literal: true
class ProductsController < ApplicationController
  def index
    @display_subnavbar = true
    @tab = 'product_index'
    client = DataApiClient.new
    api_params = filter_params
    @items = client.call_all_items(api_params)
  end

  def show
    @display_subnavbar = true
    client = DataApiClient.new
    @item = JSON.parse client.call_one_item(params[:id]).body
  end

  private

  def filter_params
    filters = [:full_name, :brand, :sku, :category_1, :product_code, :in_stock, :details, :color, :price_under, :price_over]
    api_params = '?'
    filters.each { |f| api_params += "#{f}=#{params[f]}&" if params[f] }
    api_params
  end
end
