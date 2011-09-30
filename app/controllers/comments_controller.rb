class CommentsController < ApplicationController
  before_filter :load_article, :except =>  [:create, :destroy, :approve, :unapprove]
  before_filter :authenticate, :only => :destroy
  def create 
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(params[:comment])
      if @comment.save
        redirect_to @article, :notice => 'Thanks for your comment'
      else
        redirect_to @article, :alert => 'Unable to add comment' 
      end
  end
    
  def destroy
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id]) 
    @comment.destroy   
    redirect_to @article, :notice => 'Comment deleted'
  end
  
  def show
     @comments = Comments.where(:article_id => @article.id)

     respond_to do |format|
       format.html # show.html.erb
       format.xml { render :xml => @article }
     end
  end
  
  def approve
    comment = Comment.find(params[:id])
    comment.approved = 'true'
    comment.save
    article = Article.find(:all, :conditions=>["id = ?", comment.article_id])
    redirect_to article, :notice=> ' has been approved.' 
  end
  
  def unapprove
      comment = Comment.find(params[:id])
      comment.approved = 'false'
      comment.save
      article = Article.find(:all, :conditions=>["id = ?", comment.article_id])
      redirect_to article, :notice=> ' has been unapproved.'
  end
  private
  def load_article
    @article = Article.find(params[:article_id])
  end
end

