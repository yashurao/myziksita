class Article < ActiveRecord::Base
  attr_accessor :tags_list
  attr_accessible :tags_list, :tag_id, :content, :title

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :article_tags, :dependent => :destroy
  has_many :tags, :through => :article_tags

  after_save :create_article_tags

  def should_generate_new_friendly_id?
    new_record?
  end

  def tags_list
    tags.collect(&:name).join(', ')
  end

  def tags_list=(tags)
    @tags_list = tags
  end

  def create_article_tags
    article_tags.destroy_all
    unless @tags_list.blank?
      tags = @tags_list.split(',')
      tags.each do |tags|
        tags = tags.to_s.strip
        tags_exists = Tag.find_or_create_by_name(tags)
        tag_id =  tags_exists.id
        self.article_tags.create(article_id: self.id, tag_id: tag_id)
      end
    end
  end
end
