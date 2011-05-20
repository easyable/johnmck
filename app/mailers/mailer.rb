class Mailer < ActionMailer::Base
  default :from => "easyable01@gmail.com"
  
  def interest(contact)
      @name = contact[:name]
      @email = contact[:email]
      @company = contact[:company]
      @message = contact[:message]
      mail(:to => "John McKelvie <easyable01@gmail.com", :subject=>"Message from website contact form")
  end
end
