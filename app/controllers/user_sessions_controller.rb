class UserSessionsController < ApplicationController
  def new
    redirect_back_or_to(:users, notice: '已登入!') if logged_in?
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_back_or_to(:users, notice: '登入成功!')
    else
      flash.now[:alert] = '帳號或密碼錯誤!'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
