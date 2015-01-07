class Admin::CountersController < ApplicationController
  before_action :require_login
  before_action :set_admin_counter, only: [:edit, :update]

  def index
    @admin_counters = Admin::Counter.all
  end

  def edit
  end


  def update
    if @admin_counter.update(admin_counter_params)
      redirect_to admin_counters_path
    else
      render :edit
    end
  end

  private
    def set_admin_counter
      @admin_counter = Admin::Counter.find(params[:id])
    end

    def admin_counter_params
      params.require(:admin_counter).permit(:category, :number)
    end
end
