class CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!, only: %i[create]
  before_action :set_article
  before_action :set_comment, except: %i[create]

  def new
    @comment = @article.comments.build
  end

  def create 
    @comment = @article.comments.build(comment_params)

    if @comment.save
    flash[:success] = "Successfully added comment!"
      redirect_to article_path(@article)
    else
      @pagy, @comments = pagy @article.comments.order created_at: :desc 
      render 'articles/show'
    end
  end

  def destroy   
    @comment.destroy
    flash[:success] = "Comment has been deleted!"
    redirect_to article_path(@article)
  end

  def edit    
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = "Comment has been updated!"
      redirect_to article_path(@article, anchor: dom_id(@comment))
    else 
      render :edit
    end
  end

  private 

  def comment_params
    params.require(:comment).permit( :author, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
	end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end
end 
