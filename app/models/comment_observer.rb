class CommentObserver < ActiveRecord::Observer
    def after_create(comment)
      puts " We will notify the author ", :init
    end
end
