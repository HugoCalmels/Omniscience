# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!



ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 465,
    domain: ENV['SMTP_DOMAIN'],
    user_name: ENV['SMTP_USER_NAME'],
    password: ENV['SMTP_PASSWORD'],
    authentication: 'plain',
    :ssl => true,
    :tsl => true,
    enable_starttls_auto: true 
  }
