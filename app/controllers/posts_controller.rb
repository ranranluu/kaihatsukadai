class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice]="You have posted dairy successfully."
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      flash[:notice]="You have updated dairy successfully."
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.user_id = current_user.id
    post.destroy
    flash[:notice]="You have deleted dairy successfully."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
