class PostsController < ApplicationController
  def index
    @user = User.where(id: params[:user_id]).first
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.where(author_id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
    @user = User.find(params[:user_id])
    @all_users = User.all
  end

  def create
    new_post = Post.new(title: params[:post][:title], text: params[:post][:text], author: current_user)
    if new_post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end
end
