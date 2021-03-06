class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of :name, :email  
  validates_format_of :email,
                      :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
                      :message => "must be a valid email address"
 
  scope :is_approved, where("comments.approved IS true") 
  scope :not_approved, where("comments.approved IS false")
  
  
  def comment_should_be_approved
      errors.add(:comment_id, "is not approved yet") if comment && !comment.is_approved?
  end
  
  after_create :init

  def init
    self.approved = 'false'
    self.save
  end      
end
