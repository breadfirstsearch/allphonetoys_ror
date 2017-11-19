# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.default_url_options = { :host => 'myapp.herokuapp.com' } 
config.action_mailer.raise_delivery_errors = true
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = true

config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain: "myapp.herokuapp.com",
    :authentication => "plain",
    :enable_starttls_auto => true,
    :user_name => "habib1.baig@gmail.com",
    :password => "Alpacino1!"
  }