class CommentsController < ApplicationController

  def new
      @comments=Comment.new
  end


  def index
      @comments=Comment.all
  end
  def create
  @comments=Comment.new(comment_params)
  @comments.user= current_user
  @comments.article= Article.find(params[:article_id])
  @article= Article.find(params[:article_id])
  respond_to do |format|
    if @comments.save
        format.html { redirect_to user_group_article_path(current_user,@article.group,@comments.article), notice: "Comment Created" }  
      else
        format.html { render :new, status: :unprocessable_entity }
      end       
    end
  end

  
  
  private
  def comment_params
      params.require(:comment).permit(:comment,:user_id,:article_id)

  end

end