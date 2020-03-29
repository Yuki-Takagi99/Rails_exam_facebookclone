class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      #ブログ一覧画面へ遷移
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      #入力フォームを再度描画
      render :new
    end
  end
  def show
    # @blog = Blog.find(params[:id])
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
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
