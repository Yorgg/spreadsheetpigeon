require 'open-uri'

class SpreadsheetRequest 
  KEY = ENV.fetch('GOOGLE_API_KEY') 
  attr_accessor :data
 
  def initialize(range:, id:)
    self.data = make_request(range, id)
  end
  
  private

  def make_request(range, id)
    base = "https://sheets.googleapis.com/v4/spreadsheets"
    url = "#{base}/#{id}/values/#{range}?key=#{KEY}" 
    open(url).read 
  end
end
