require 'net/http'

namespace :ping do 
  desc "This task is called by the Heroku scheduler add-on"
  task :start => :environment do
    http = Net::HTTP.new 'spreadsheet-pigeon.herokuapp.com'
    puts http.request_get('/')
  end
end

