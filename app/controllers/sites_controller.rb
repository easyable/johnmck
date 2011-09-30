class SitesController < ApplicationController

  def home
    @marketing = Category.where(:name=>"Marketing Tips").first.articles.order('created_at DESC').page(params[:page]).per(1) 
    marketing = Category.where(:name=>"Marketing Tips").first
    #Figure out how to return AR objects rather than array
    @articles = Article.where("id NOT IN (?)", marketing.article_ids).order('created_at DESC').page(params[:page]).per(1)
  end 

  def index
   
  end
  
  def marketing      
      @marketing = Category.where(:name=>"Marketing Tips").first.articles.page(params[:page]).per(1) 
      marketing = Category.where(:name=>"Marketing Tips").first
      @article = @marketing.last
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

