class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author_id: params[:id])
  end
end
