#Exclude this file from git repo
ActionMailer::Base.smtp_settings = {
    :address=>'smtp.gmail.com',
    :port => 587,
    :domain => "gmail.com",
    :user_name => "brian@cicutti.com",
    :password => "B42scSac",
    :authentication=>"plain",
    :enable_starttls_auto => true
}