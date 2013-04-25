class ArticleTag < ActiveRecord::Base
  attr_accessible :tag_id

  belongs_to :tag
  belongs_to :article

  validates_presence_of :tag_id, :article_id
  validates_uniqueness_of :tag_id, :scope => [:article_id]
end
