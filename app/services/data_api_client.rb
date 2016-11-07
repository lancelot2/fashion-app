# frozen_string_literal: true
class DataApiClient
  def call_all_items
    base_url = 'https://smartdata-api.herokuapp.com/v1/items'
    return JSON.parse Curl::Easy.perform(base_url).body_str
  rescue => e
    puts "*** ! Error making API call, error msg: #{e} ! ***"
  end

  def call_one_item(id)
    base_url = 'https://smartdata-api.herokuapp.com/v1/items/'
    return JSON.parse Curl::Easy.perform(base_url + id.to_s).body_str
  rescue => e
    puts "*** ! Error making API call, error msg: #{e} ! ***"
  end
end
