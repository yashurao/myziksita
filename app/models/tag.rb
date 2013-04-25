class Tag < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :presence => true, :uniqueness => true

  def should_generate_new_friendly_id?
    new_record?
  end

end
