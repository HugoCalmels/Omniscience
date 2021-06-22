# Load the Rails application.
require_relative 'application'
require 'dotenv'

Dotenv.load

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: 'apikey', 
  password: ENV['SENDGRID_API_KEY'], 
  domain: 'omniscience-thp.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}


