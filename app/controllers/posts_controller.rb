class PostsController < ApplicationController
  #ログイン前このアクションは使えない設定に
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      #投稿がセーブできたらフラッシュメッセージを出して投稿一覧へ遷移
      flash[:notice]="You have posted dairy successfully."
      redirect_to posts_path
    else
      #投稿がセーブできなければrenderで新規投稿画面へ
      render :new
    end
  end

  def index
    #kaminariで投稿一覧は8件ずつ新着順から表示
    @posts = Post.order("created_at DESC").page(params[:page]).per(8)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      #投稿が更新できたらフラッシュメッセージを出して投稿一覧へ遷移
      flash[:notice]="You have updated dairy successfully."
      redirect_to posts_path
    else
      #投稿が更新できなければrenderで新規投稿画面へ
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.user_id = current_user.id
    post.destroy
    #投稿が削除できたらフラッシュメッセージを出して投稿一覧へ遷移
    flash[:notice]="You have deleted dairy successfully."
    redirect_to posts_path
  end

  private
  #パラメータの設定
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
