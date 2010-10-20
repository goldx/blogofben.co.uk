class Comment < ActiveRecord::Base
  belongs_to :article
  
  validates_presence_of :article_id, :body, :poster_name
end
