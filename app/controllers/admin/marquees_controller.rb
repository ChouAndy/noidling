class Admin::MarqueesController < ApplicationController
  before_action :require_login
  before_action :set_admin_marquee, only: [:show, :edit, :update, :destroy]

  def index
    @admin_marquees = Admin::Marquee.all
  end

  def show
  end

  def new
    @admin_marquee = Admin::Marquee.new
  end

  def edit
  end

  def create
    @admin_marquee = Admin::Marquee.new(admin_marquee_params)

    if @admin_marquee.save
      redirect_to @admin_marquee
    else
      render :new
    end
  end

  def update
    if @admin_marquee.update(admin_marquee_params)
      redirect_to @admin_marquee
    else
      render :edit
    end
  end

  def destroy
    @admin_marquee.destroy
    redirect_to admin_marquees_url
  end

  private
    def set_admin_marquee
      @admin_marquee = Admin::Marquee.find(params[:id])
    end

    def admin_marquee_params
      params.require(:admin_marquee).permit(:text)
    end
end
