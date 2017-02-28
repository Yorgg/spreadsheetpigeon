require 'open-uri'

class SpreadsheetService
  API_KEY = ENV.fetch('GOOGLE_API_KEY') 
  API_URL = 'https://sheets.googleapis.com/v4'
  
  class ConfigError < StandardError; end

  def initialize
    raise ConfigError if !API_KEY || !API_URL
  end

  #Send GET request to Google Spreadsheet api
  def get(range:, id:)
    begin
      open(get_request_path(range,id)).read 
    rescue => e
      e.inspect 
    end
  end
  
  private

  def get_request_path(range, id)
    "#{API_URL}/spreadsheets/#{id}/values/#{range}?key=#{API_KEY}" 
  end
end
