class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts
  end
end
