class TagsController < ApplicationController
  layout 'tags'

  def show
    tag = Tag.find params[:id]
    article_tag = ArticleTag.find_all_by_tag_id tag.id
    @articles = article_tag.map(&:article)
  end

end
