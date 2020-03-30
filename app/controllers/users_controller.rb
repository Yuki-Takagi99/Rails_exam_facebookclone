class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # ユーザ新規登録に成功した場合の処理
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      # ユーザ新規登録に失敗した場合の処理
      render :new
    end
  end
  def show
    # 表示するユーザのidを取得
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
