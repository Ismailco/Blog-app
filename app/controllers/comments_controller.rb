class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(current_user.id, params[:post_id]), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @comment = current_user.comments.new(comment_params)
  #   @comment.post_id = params[:post_id]
  #   if @comment.save
  #     redirect_to user_post_path(current_user.id, params[:post_id])
  #   else
  #     render :create
  #   end
  # end

  private

  def comment_params
    params.permit(:text)
  end
end