class Article < ActiveRecord::Base
  validates_presence_of :title, :introduction
  
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments

  acts_as_taggable
  
  scope :where_title, lambda { |term| where("articles.title LIKE ?", "%#{term}%") }
  
  def self.search(search)
    if search      
      find(:all, :conditions => ['title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
    
  def current_user
     return false unless current_user.is_a? User
     user == current_user
  end
  
  def owned_by?(owner)
    return false unless owner.is_a? current_user
    current_user == owner
  end
  
  def videntifier
    str = self.vlocation
    if str.include? 'v='
      index = str.index('v=')
      str = str.last(str.length - index)
      str = str.last(str.length - 2)
    end
    if str.include? '&'
      index = str.index('&')
       str = str.first(index)
    end
    return str
  end
end