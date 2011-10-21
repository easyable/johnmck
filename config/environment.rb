# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Johnmck::Application.initialize!

ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com", 
   :enable_starttls_auto => true, 
   :port => 587, 
   :authentication => :plain, 
   :user_name => "easyable01@johnjmckelvie.com", :password => 'Nancy123'
 }