# frozen_string_literal: true
class DataApiClient
  def initialize
    @base_url = 'https://smartdata-api.herokuapp.com'
  end

  def call_all_items(params = {})
    return RestClient.get url('/v1/items'), params: params
  rescue => e
    puts "*** ! Error making API call, error msg: #{e} ! ***"
  end

  def call_one_item(id)
    base_url = 'https://smartdata-api.herokuapp.com/v1/items/'
    return JSON.parse Curl::Easy.perform(base_url + id.to_s).body_str
  rescue => e
    puts "*** ! Error making API call, error msg: #{e} ! ***"
  end

  private

  def url(path)
    "#{@base_url}#{path}"
  end
end
