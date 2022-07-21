class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: @user.id).order(created_at: :DESC)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
