class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order('created_at asc')
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(params[:article])
    #article = params[:article]
    #@tags_list = article[:tags_list]
    #@article = Article.new
    #@article.title = article['title']
    #@article.content = article['content']
    #@article.tags_list = article['tags_list']
    #@article.save
    redirect_to article_path(@article)
  end

  def show
    #@article = Article.find(params[:id])
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    #article = params[:article]
    #@article = Article.find params[:id]
    #@article.update_attributes(title: article['title'], content: article['content'], tags_list: article['tags_list'])
    @article.update_attributes!(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit!(:title, :content, :tags_list)
  end

end
