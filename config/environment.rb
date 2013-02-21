# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TopThis::Application.initialize!

# Set up timezone to be US central time
config.time_zone = 'Central Time (US & Canada)'
