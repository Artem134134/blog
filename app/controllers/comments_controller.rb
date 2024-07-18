class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[:create]
  before_action :set_question

  def create 
  
    @article.comments.create(comment_params)
    flash[:success] = "Successfully added comment!"
      redirect_to @article
  end

  private 

  def comment_params
    params.require(:comment).permit( :author, :body)
  end

  def set_question
    @article = Article.find(params[:article_id])
	end
end 
