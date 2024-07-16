
class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[:new, :create, :edit, :update, :destroy, :show]
  before_action :set_question, only: %i[show destroy edit update]
  
  def index
    @articles = Article.all
    @article  = Article.new
  end 

  def show

  end 

  def new 
    @article  = Article.new
  end

  def create
    @article  = Article.new(article_params)
    if @article.save
      flash[:success] = "Successfully created article!"
       redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update

    if @article.update(article_params)
      flash[:success] = "Successfully updated article!"
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
      
    @article.destroy  
    flash[:success] = "Successfully deleted article!"

    redirect_to articles_path    
  end

  private 

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_question
    @article = Article.find params[:id] 
  end
end