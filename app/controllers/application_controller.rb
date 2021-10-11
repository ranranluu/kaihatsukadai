class ApplicationController < ActionController::Base
  #nameを受け取れるようにする記述
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  #ログインすると投稿一覧へ遷移
  def after_sign_in_path_for(resource)
    posts_path
  end
  
  #ログアウトするとルート画面へ遷移
  def after_sign_out_path_for(resource)
    root_path
  end
end
