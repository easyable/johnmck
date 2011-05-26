class CommentsController < ApplicationController
  before_filter :load_article, :except => [:destroy, :approve, :unapprove]
  
  def create
    @comment = @article.comments.new(params[:comment])
    if @comment.save
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
      @article = Article.find(params[:id])
    end
end


