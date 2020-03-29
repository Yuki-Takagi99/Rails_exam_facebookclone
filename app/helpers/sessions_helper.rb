module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    # ログインしていればtrue,その他ならfalseを返す
    current_user.present?
  end
end
