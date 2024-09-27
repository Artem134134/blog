# frozen_string_literal: true

class ArticlesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!, except: %i[index show] # метод из devise
  before_action :set_article, only: %i[show destroy edit update]
  before_action :authorize_article!, except: %i[index show]
  after_action :verify_authorized, except: %i[index show] # метод из pundit

  def index
    @article = Article.new
    @pagy, @articles = pagy Article.includes(:user).order(created_at: :desc)
  end

  def show
    @comment = @article.comments.build
    @pagy, @comments = pagy @article.comments.includes(:user).order created_at: :desc
  end

  def new
    @article  = Article.new
  end

  def edit; end

  def create
    @article  = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = t '.success'
      redirect_to articles_path
    else
      flash.now[:warning] = t '.warning'
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = t '.success'
      redirect_to articles_path(@articles, anchor: dom_id(@article))
    else
      flash.now[:warning] = t '.warning'
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = t '.success'

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_article
    @article = Article.find params[:id]
  end

  def authorize_article!
    authorize(@article || Article)
  end
end
