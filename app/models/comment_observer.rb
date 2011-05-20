class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    puts " We will notify the author "
  end
    
  def current_user
    @user = current_user
  end
end

 