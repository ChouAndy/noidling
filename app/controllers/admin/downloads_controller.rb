class Admin::DownloadsController < ApplicationController
  before_action :require_login
  before_action :set_admin_download, only: [:show, :edit, :update, :destroy]

  def index
    @admin_downloads = Admin::Download.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @admin_download = Admin::Download.new
  end

  def edit
  end

  def create
    @admin_download = Admin::Download.new(admin_download_params)
    process_download_type

    if @admin_download.save
      redirect_to @admin_download
    else
      render :new
    end
  end

  def update
    @admin_download.assign_attributes(admin_download_params)
    process_download_type

    if @admin_download.save
      redirect_to @admin_download
    else
      render :edit
    end
  end

  def destroy
    @admin_download.destroy
    redirect_to admin_downloads_url
  end

  private
    def set_admin_download
      @admin_download = Admin::Download.find(params[:id])
    end

    def admin_download_params
      params.require(:admin_download).permit(:category, :title, :download_type, :upload, :url, :url_file_name, :url_file_content_type, :url_file_size, :url_file_size_unit)
    end

    def process_download_type
      if @admin_download.download_type == 0
        @admin_download.url = nil
        @admin_download.url_file_name = nil
        @admin_download.url_file_content_type = nil
        @admin_download.url_file_size = nil
        @admin_download.url_file_size_unit = nil
      elsif @admin_download.download_type == 1
        @admin_download.upload = nil
        @admin_download.url_file_name = @admin_download.url.split('/').last
        @admin_download.url_file_content_type = MIME::Types.type_for(@admin_download.url_file_name).collect(&:content_type).first
      end
    end
end
