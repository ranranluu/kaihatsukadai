class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
end
