class DownloadsController < ApplicationController
  def index
    @downloads = Admin::Download.page(params[:page]).per(10)
  end
end
