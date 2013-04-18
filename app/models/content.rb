class Content < ActiveRecord::Base
  attr_accessible :tags, :tags_list
  attr_accessor :tags_list
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :content_tags, :dependent => :destroy
  has_many :tags, :through => :content_tags

  after_save :create_content_tags

  def should_generate_new_friendly_id?
    new_record?
  end

  def tags_list
    @tags = self.tags.collect(&:name).join(', ')
    raise @tags unless @tags.blank?
  end

  def tags_list=(tags)
    @tags = tags
  end

  private

  def create_content_tags
    self.content_tags.destroy_all
    unless @tags.blank?
      tags = @tags.split(',')
      tags.each do |tags|
        tags = tags.to_s.strip
        tag_exists = Tag.find_by_name(tags)
        unless tag_exists.present?
          tag_exists = Tag.create(name: tags)
        end
        ContentTag.create(content_id: self.id, tag_id: tag_exists.id)
      end
    end
  end

end
