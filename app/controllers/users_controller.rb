class UsersController < ApplicationController
  #ログイン前このアクションは使えない設定に
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    #kaminariでユーザー詳細画面内の投稿一覧は4件ずつ新着順から表示
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(4)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      #ユーザー情報が更新できたらフラッシュメッセージを出してユーザー詳細へ遷移
      flash[:notice]="You have updated your information successfully."
      redirect_to user_path(current_user)
    else
      #投稿が更新できなければrenderでユーザー更新画面へ
      render :edit
    end
  end

  private
  #パラメータの設定
  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
