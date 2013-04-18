class ContentTag < ActiveRecord::Base

  belongs_to :tag
  belongs_to :content

  validates_presence_of :tag_id, :content_id
  validates_uniqueness_of :tag_id, :scope => [:content_id]
end
