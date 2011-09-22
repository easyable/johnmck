class SitesController < ApplicationController

  def home
    
    category = Category.find(:first, :name=>"marketing tips")
    @marketing_articles = category.articles.page(params[:page]).per(1)
    @full_articles = (Article.all - @marketing_articles).page(params[:page]).per(1)
  end

  def index
   
  end
  
  def marketing      
    @article = marketing_articles.last
    
  end
  
  def about
      
  end
  
  def contact
    @title = "Contact Us"
    
    if request.post?
        Mailer.interest(params[:contact]).deliver
        flash[:notice] = "Your message has been sent, you should hear from us shortly!"
        redirect_to :action =>'contact'
    end
  end
  
  def services
    @title = "Services"
  end
  
  def approvals
    @comments = Comment.find(:all, :conditions => ['approved = ?', "false"], :order => 'created_at DESC')  
  #def approvals
  #  @title = "Approvals Page"
  #  @current_user = current_user
  #  @comments = Comment.find(:all, :conditions => ['approved = ?', "false"], :order => 'created_at DESC')
  end
end
