class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @articles = Article.all.order('created_at asc')
  end

  def new
    @article = Article.new
  end

  def create
    current_user.articles.create(params[:article])
    redirect_to article_path(@article)
  end

  def show
  end

  def edit
  end

  def update
    @article.update_attributes!(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find_by_slug(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :tags_list)
  end

end
