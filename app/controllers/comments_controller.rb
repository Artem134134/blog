# frozen_string_literal: true

class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!, only: %i[create]
  before_action :set_article
  before_action :set_comment, except: %i[create]

  def new
    @comment = @article.comments.build
  end

  def edit; end

  def create
    @comment = @article.comments.build(comment_params)

    if @comment.save
      flash[:success] = '.success'
      redirect_to article_path(@article)
    else
      @pagy, @comments = pagy @article.comments.order created_at: :desc
      flash.now[:warning] = t '.warning'
      render 'articles/show'
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = '.success'
      redirect_to article_path(@article, anchor: dom_id(@comment))
    else
      flash.now[:warning] = t '.warning'
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = '.success'
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end
end
