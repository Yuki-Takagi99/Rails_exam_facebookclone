class BlogsController < ApplicationController
  before_action :must_login, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  def create
    #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end
  def show
    # ログインしているユーザがそのブログをお気に入り登録しているかどうかを判断
      @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  def edit
    # @blog = Blog.find(params[:id])
  end
  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      #ブログ一覧画面へ遷移
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      #編集画面を再度描画
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  def confirm
    #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
    @blog = current_user.blogs.build(blog_params)
    #@blog.invalidでバリデーションが失敗したらnew画面に遷移
    render :new if @blog.invalid?
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
