class CommentsController < ApplicationController
  before_filter :load_article, :except => :destroy
  before_filter :notify_admin
  
  def create
    @comment = @article.comments.new(params[:comment])
    if @comment.save
      # notify Admin to approve
      redirect_to @article, :notice => ' Thanks for your comment. It will appear in a day or two'
    else
      redirect_to @article, :alert => ' Unable to add comment'
    end
  end
  
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, :notice => 'Comment deleted' 
  end
  
  private
    def load_article
      @article = Article.find(params[:article_id])
    end
    
    def notify_admin
        #email Admin
    end 
end

