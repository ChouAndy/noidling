class Admin::NewsController < ApplicationController
  before_action :require_login
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.order('public_date DESC').page(params[:page]).per(5)
  end

  def show
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to [:admin, @news]
    else
      render :new
    end
  end

  def update
    if @news.update(news_params)
      redirect_to [:admin, @news]
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to admin_news_index_url
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:public_date, :title, :content, :click)
    end
end
