#Exclude this file from git repo
ActionMailer::Base.smtp_settings = {
    :address=>'smtp.gmail.com',
    :port => 587,
    :domain => "gmail.com",
<<<<<<< HEAD
    :user_name => "easyable01@gmail.com",
=======
    :user_name => "easyable01@gmail.com",
>>>>>>> a8b640a77a6f4d64f6d4b6ec16eef970c633055d
    :password => "Nancy123",
    :authentication=>"plain",
    :enable_starttls_auto => true
}