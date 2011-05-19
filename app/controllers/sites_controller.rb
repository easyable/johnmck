class SitesController < ApplicationController

  def index
   
  end
  
  def marketing
      
  end
  
  def about
      
  end
  
  def contact
    @title = "Contact Us"
    
    if request.post?
        Mailer.interest(params[:contact]).deliver
        flash[:notice] = "Your message has been sent, you should hear from us shortly!"
        redirect_to :action=>'contact'
    end
  end
  
  def services
    @title = "Services"
  end
    
  #def approvals
  #  @title = "Approvals Page"
  #  @current_user = current_user
  #  @comments = Comment.find(:all, :conditions => ['approved = ?', "false"], :order => 'created_at DESC')
  #end

end
