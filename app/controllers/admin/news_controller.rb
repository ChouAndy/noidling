class Admin::NewsController < ApplicationController
  before_action :require_login
  before_action :set_admin_news, only: [:show, :edit, :update, :destroy]

  def index
    @admin_news = Admin::News.order('public_date DESC').page(params[:page]).per(5)
  end

  def show
  end

  def new
    @admin_news = Admin::News.new
  end

  def edit
  end

  def create
    @admin_news = Admin::News.new(admin_news_params)

    if @admin_news.save
      redirect_to @admin_news
    else
      render :new
    end
  end

  def update
    if @admin_news.update(admin_news_params)
      redirect_to @admin_news
    else
      render :edit
    end
  end

  def destroy
    @admin_news.destroy
    redirect_to admin_news_index_url
  end

  private
    def set_admin_news
      @admin_news = Admin::News.find(params[:id])
    end

    def admin_news_params
      params.require(:admin_news).permit(:public_date, :title, :content, :click)
    end
end
