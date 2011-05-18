class Comment < ActiveRecord::Base
  belongs_to :article
  
  validates_format_of :email,
                      :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
                      :message => "must be a valid email address"
  
  scope :approved, where("comments.approve_bool IS true") 
  scope :not_approved, where("comments.approve_bool IS false")
  
  def comment_should_be_approved
      errors.add(:comment_id, "is not published yet") if comment && !comment.approved?
  end
 

  
  before_create :init

  def init
    self.approve_bool = 'false'
    self.save
  end      
end
