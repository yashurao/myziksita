class CreateContentTags < ActiveRecord::Migration
  def change
    create_table :content_tags do |t|
      t.references :content
      t.references :tag
      t.timestamps
    end
  end
end
