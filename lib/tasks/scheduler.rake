require 'net/http'

namespace :ping do 
  desc "This task is called by the Heroku scheduler add-on"
  task :start => :environment do
    begin
      uri = URI('http://spreadsheetpigeon1.herokuapp.com/spreadsheet')
      http = Net::HTTP.new uri 
    rescue Exception => e   
      puts e
    end   
  end
end

