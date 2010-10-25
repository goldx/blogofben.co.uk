class Article < ActiveRecord::Base
  has_many :comments
  acts_as_taggable
  
  validates_presence_of :body, :title
  
  def tags_string
    self.tag_list.to_s
  end
  
  def tags_string=(new_tags)
    self.tag_list = ActsAsTaggableOn::TagList.from(new_tags)
  end
end
