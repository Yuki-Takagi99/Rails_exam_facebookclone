class SessionsController < ApplicationController
  def new
  end
  def create
    # 入力されたemailの値と同じものをデータベースから検索しuserに代入
    user = User.find_by(email: params[:session][:email].downcase)
    # 入力されたemailの値とデータベースの値が一致しているかどうかを判定
    if user && user.authenticate(params[:session][:password])
      # ログイン成功した場合
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      # ログイン失敗した場合
      flash.now[:danger] = '入力されたメールアドレスまたはパスワードがアカウントと一致しません！もう一度確認してください！'
      render :new
    end
  end
  def destroy
      session.delete(:user_id)
      flash[:notice] = 'ログアウトしました！'
      redirect_to new_session_path
  end
end
