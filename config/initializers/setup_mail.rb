#Exclude this file from git repo
ActionMailer::Base.smtp_settings = {
    :address=>'smtp.gmail.com',
    :port => 587,
    :domain => "gmail.com",
    :user_name => "easyable01@gmail",
    :password => "Nancy123",
    :authentication=>"plain",
    :enable_starttls_auto => true
}