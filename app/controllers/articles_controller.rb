class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find params[:id]
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new articles_params
    if @article.save
      # respond_to do |format|
      #   format.js
      # end
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
    article = Article.find params[:id]
    article.destroy
  end

  private

  def articles_params
    params.require(:article).permit(:title, :content, :category_id)
  end
end
