class SitesController < ApplicationController

  def index
    @title = "Welcome to the Library!"
  end
  
  def marketing
      
  end
  
  def about
      
  end
  
  def contact
    @title = "Contact Us"
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
