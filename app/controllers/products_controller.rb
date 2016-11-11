# frozen_string_literal: true
class ProductsController < ApplicationController
  def index
    @display_subnavbar = true
    @tab = 'product_index'
    client = DataApiClient.new
    api_params = filter_params
    rest_reponse = client.call_all_items(api_params)
    @items = (rest_reponse ? [JSON.parse(rest_reponse.body), rest_reponse.headers] : nil)
  end

  def show
    @display_subnavbar = true
    client = DataApiClient.new
    @item = JSON.parse client.call_one_item(params[:id]).body
  end

  private

  def filter_params
    filters = [:full_name, :brand, :sku, :category_1, :product_code, :in_stock, :details, :color, :min_price, :max_price]
    api_params = '?'
    filters.each { |f| api_params += "#{f}=#{params[f]}&" if params[f] }
    api_params
  end
end
