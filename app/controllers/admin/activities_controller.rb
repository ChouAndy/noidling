class Admin::ActivitiesController < ApplicationController
  before_action :require_login
  before_action :set_admin_activity, only: [:show, :edit, :update, :destroy]

  def index
    @admin_activities = Admin::Activity.order('hold_date DESC').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @admin_activity = Admin::Activity.new
  end

  def edit
  end

  def create
    @admin_activity = Admin::Activity.new(admin_activity_params)

    if @admin_activity.save
      redirect_to @admin_activity
    else
      render :new
    end
  end

  def update
    if @admin_activity.update(admin_activity_params)
      redirect_to @admin_activity
    else
      render :edit
    end
  end

  def destroy
    @admin_activity.destroy
    redirect_to admin_activities_url
  end

  private
    def set_admin_activity
      @admin_activity = Admin::Activity.find(params[:id])
    end

    def admin_activity_params
      params.require(:admin_activity).permit(:name, :subject, :sponsor, :cosponsor, :hold_date, :start_time, :end_time, :site, :achievement)
    end
end
