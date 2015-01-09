class Admin::PicsController < ApplicationController
  before_action :require_login
  before_action :set_admin_pic, only: [:destroy]

  def index
    @admin_activity = Admin::Activity.find(params[:activity_id])
    @admin_pics = @admin_activity.pics
  end

  def new
    @admin_pic = Admin::Pic.new
  end

  def create
    @admin_activity = Admin::Activity.find(params[:activity_id])
    @admin_pic = @admin_activity.pics.build(admin_pic_params)

    if @admin_pic.save
      redirect_to admin_activity_pics_url
    else
      render :new
    end
  end

  def destroy
    @admin_pic.destroy
    redirect_to admin_activity_pics_url
  end

  private
    def set_admin_pic
      @admin_pic = Admin::Pic.find(params[:id])
    end

    def admin_pic_params
      params.require(:admin_pic).permit(:admin_activity_id, :pic)
    end
end
