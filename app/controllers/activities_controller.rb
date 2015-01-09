class ActivitiesController < ApplicationController
  def index
    @activities = Admin::Activity.page(params[:page]).per(10)
  end

  def show
    @activity = Admin::Activity.find(params[:id])
  end
end
