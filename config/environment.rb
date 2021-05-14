# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# s36889490@student.rmit.edu.au 
# Evan0109Evan0109
# fashionappS3688949@gmail.com
# Evan0109

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => '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', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'gmail.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}