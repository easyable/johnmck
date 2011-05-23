class CommentsController < ApplicationController
  before_filter :load_article, :except => :destroy
  
  def create
    @comment = @article.comments.new(params[:comment])
    if @comment.save
      # notify Admin to approve
      redirect_to @article, :notice => ' Thanks for your comment. It will appear in a day or two'
    else
      redirect_to @article, :alert => ' Unable to add your comment'
    end
  end
  
  def destroy
      @article.comment = current_user.articles.comment.find(params[:id])
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to(articles_url) }
        format.xml { head :ok }
  end
  def show
     @comments = Comments.where(:article_id => @article.id)

     respond_to do |format|
       format.html # show.html.erb
       format.xml { render :xml => @article }
     end
  end
  
  
  def approve
    @comment.approved = 'true'
    @comment.save
    redirect_to @article, :notice=> ' has been approved.' 
  end
  
  private
    def load_article
      @article = Article.find(params[:article_id])
    end
end


