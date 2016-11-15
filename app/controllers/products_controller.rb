# frozen_string_literal: true
class ProductsController < ApplicationController
  def index
    @display_subnavbar = true
    @tab = 'product_index'
    client = DataApiClient.new
    api_params = filter_params
    rest_reponse = client.call_all_items(api_params)
    @items = (rest_reponse ? [JSON.parse(rest_reponse.body), rest_reponse.headers] : nil)
    @search = Search.new
  end

  def show
    @display_subnavbar = true
    client = DataApiClient.new
    @item = JSON.parse client.call_one_item(params[:id]).body
  end

  def export
    client = DataApiClient.new
    api_params = filter_params
    i = 1
    @items = []
    loop do
      rest_reponse = client.call_all_items(api_params + "page=#{i}")
      @items << JSON.parse(rest_reponse.body)
      i += 1
      break if rest_reponse.body == '[]'
    end
    @items.flatten!
    respond_to do |format|
      format.csv { send_data export_csv(@items, @headers = nil) }
    end
  end

  private

  def filter_params
    filters = [:full_name, :brand, :sku, :category_1, :product_code, :in_stock, :details, :color, :min_price, :max_price]
    api_params = '?'
    filters.each { |f| api_params += "#{f}=#{params[f]}&" if params[f] }
    api_params
  end

  def export_csv(items, headers)
    CSV.generate do |csv|
      csv << headers unless column_headers.nil?
      items.each do |item|
        csv << [item['full_name'], item['sku']] # Add dynamic content here
      end
    end
  end
end
