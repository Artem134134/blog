class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_article, only: %i[create destroy]

  def new
    @comment = @article.comments.build
  end

  def create 
    @comment = @article.comments.build(comment_params)

    if @comment.save
    flash[:success] = "Successfully added comment!"
      redirect_to article_path(@article)
    else
      @comments = @article.comments.order created_at: :desc 
      render 'articles/show'
    end
  end

  def destroy
    comment = @article.comments.find(params[:id])
    comment.destroy
    flash[:success] = "Comment has been deleted!"
    redirect_to article_path(@article)
  end

  private 

  def comment_params
    params.require(:comment).permit( :author, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
	end
end 
