class Admin::LawsController < ApplicationController
  before_action :require_login
  before_action :set_admin_law, only: [:show, :edit, :update, :destroy]

  def index
    @admin_laws = Admin::Law.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @admin_law = Admin::Law.new
  end

  def edit
  end

  def create
    @admin_law = Admin::Law.new(admin_law_params)

    if @admin_law.save
      redirect_to @admin_law
    else
      render :new
    end
  end

  def update
    if @admin_law.update(admin_law_params)
      redirect_to @admin_law
    else
      render :edit
    end
  end

  def destroy
    @admin_law.destroy
    redirect_to admin_laws_url
  end

  private
    def set_admin_law
      @admin_law = Admin::Law.find(params[:id])
    end

    def admin_law_params
      params.require(:admin_law).permit(:name, :site_url, :word_url, :pdf_url)
    end
end
