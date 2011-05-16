class Article < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true
  
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments

  scope :where_title, lambda { |term| where("articles.title LIKE ?", "%#(term)%") }
  
  def long_title
     "#{title} - #{published_at}"
  end
  def admin
     return false unless admin.is_a? User
     user == admin
  end
  
  def owned_by(owner)
    return false unless owner.is_a? User
    user == owner
  end
end
