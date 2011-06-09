class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  
  default_scope order('categories.name')
  scope :where_category, lambda { |term| where("articles.catergories LIKE ?", "%#(term)%") }

end
