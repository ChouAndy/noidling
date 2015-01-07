class NewsController < ApplicationController
  def index
    @news = Admin::News.order('public_date DESC').page(params[:page]).per(5)
  end

  def show
    @news = Admin::News.find(params[:id])
    @news.click += 1
    @news.save
  end
end
