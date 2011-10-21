ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com", 
  :enable_starttls_auto => true, 
  :port => 587, 
  :domain => "johnjmckelvie.com",
  :authentication => :plain, 
  :user_name => "easyable01@johnjmckelvie.com", 
  :password => "Nancy123"
}