# frozen_string_literal: true

class ArticlesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!, only: %i[new create edit update destroy show]
  before_action :set_article, only: %i[show destroy edit update]

  def index
    @article = Article.new
    @pagy, @articles = pagy Article.order(created_at: :desc)
  end

  def show
    @comment = @article.comments.build
    @pagy, @comments = pagy @article.comments.order created_at: :desc
  end

  def new
    @article  = Article.new
  end

  def edit; end

  def create
    @article  = Article.new(article_params)
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
end
