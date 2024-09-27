# frozen_string_literal: true

class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!, except: %i[index]
  before_action :set_article
  before_action :set_comment, except: %i[create]
  before_action :load_comments, only: %i[index create]
  before_action :authorize_comment!, except: %i[index]
  after_action :verify_authorized, except: %i[index] # метод из pundit

  def index; end

  def new
    @comment = @article.comments.build
  end

  def edit; end

  def create
    @comment = @article.comments.build(create_comment_params)

    if @comment.save
      flash[:success] = t '.success'
      redirect_to article_path(@article)
    else

      flash.now[:warning] = t '.warning'
      render 'articles/show'
    end
  end

  def update
    if @comment.update(update_comment_params)
      flash[:success] = t '.success'
      redirect_to article_path(@article, anchor: dom_id(@comment))
    else
      flash.now[:warning] = t '.warning'
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = t '.success'
    redirect_to article_path(@article)
  end

  private

  def create_comment_params
    params.require(:comment).permit(:author, :body).merge(user: current_user)
  end

  def update_comment_params
    params.require(:comment).permit(:author, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def load_comments
    @pagy, @comments = pagy(@article.comments.includes(:user).order(created_at: :desc))
  end

  def authorize_comment!
    authorize(@comment || Comment)
  end
end
