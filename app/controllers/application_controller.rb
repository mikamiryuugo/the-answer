class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # deviseに関係ないページのリクエストした時
  before_action :store_current_location, unless: :devise_or_home_controller?


  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました"
    # フレンドリーフォワード
    stored_location_for(resource) || root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  def devise_or_home_controller?
    devise_controller? || controller_name == 'home'
  end
end
