class ContentsController < ApplicationController

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    content = params[:content]
    @content = Content.new
    @content.title = content['title']
    @content.content = content['content']
    @content.save
    redirect_to content_path(@content)
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = params[:content]
    @tags = content['tags_list']
    @content = Content.find(params[:id])
    @content.update_attributes(title: content['title'], content: content['content'])
    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to contents_path
  end

end
