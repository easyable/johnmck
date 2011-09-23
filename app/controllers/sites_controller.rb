class SitesController < ApplicationController

  def home
<<<<<<< HEAD
    @marketing = Category.where(:name=>"Marketing Tips").first.articles.page(params[:page]).per(1) 
    marketing = Category.where(:name=>"Marketing Tips").first
    #Figure out how to return AR objects rather than array
    @articles = Article.where("id NOT IN (?)", marketing.article_ids).page(params[:page]).per(1)
  end 
=======
    
    category = Category.find(:first, :name=>"marketing tips")
    @marketing_articles = category.articles.page(params[:page]).per(1)
    @full_articles = (Article.all - @marketing_articles).page(params[:page]).per(1)
  end

>>>>>>> 9de42e430dc6369218d4c872755c3510e622b7ce
  def index
   
  end
  
  def marketing      
      @marketing = Category.where(:name=>"Marketing Tips").first.articles.page(params[:page]).per(5) 
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
