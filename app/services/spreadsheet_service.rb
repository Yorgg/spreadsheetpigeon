require 'open-uri'

module SpreadsheetService
  API_KEY = ENV.fetch('GOOGLE_API_KEY') 
  API_URL = 'https://sheets.googleapis.com/v4'

  class ConfigError < StandardError
    def initialize(msg = "API-KEY or API-Path is missing!")
      super
    end 
  end

  ## 
  ##Send GET requests to api
  #
  class Get 
    attr_accessor :data, :request_error

    def self.api
      API_KEY
    end

    def initialize(range:, id:)
      raise ConfigError if !API_KEY || !API_URL
      request(range, id.to_s)
    end

  private 

    def request(range, id)
      begin
	dataRequest = open(path(id,range)).read 
        self.data = dataRequest
      rescue Exception => e
	self.request_error = e.inspect 
      end
    end

    def path(id, range)
      "#{API_URL}/spreadsheets/#{id}/values/#{range}?key=#{API_KEY}" 
    end
  end
  
  #### 
  ##Send POST requests to api
  #
  class Post
    #for future functionality if needed
  end
end
