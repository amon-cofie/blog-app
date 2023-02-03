class PostsController < ApplicationController
  def index
    @user = User.where(id: params[:user_id]).first
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
    @user = User.find(params[:user_id])
    @all_users = User.all
  end
end
