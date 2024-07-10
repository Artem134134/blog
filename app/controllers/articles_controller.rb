
class ArticlesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy, :show]

  def index
    @articles = Article.all
    @article  = Article.new
  end 

  def show
    @article = Article.find_by id: params[:id]

  end 

  def new 
    @article  = Article.new
  end

  def create
    @article  = Article.new(article_params)

    if @article.save
       redirect_to articles_path
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find_by id: params[:id]
  end

  def update
    @article = Article.find_by id: params[:id]

    if @article.update(article_params)
       redirect_to articles_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find_by id: params[:id]  
    @article.destroy  

    redirect_to articles_path    
  end


  private 

  def article_params
    params.require(:article).permit(:title, :text)
  end
end