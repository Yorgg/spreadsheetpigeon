# Load the Rails application.
require_relative 'application'

#Load Google Api Key Environment Variable
if Rails.env.development? 
  load File.join(Rails.root, 'config', 'google_api_key.rb')
end

# Initialize the Rails application.
Rails.application.initialize!
