class DownloadsController < ApplicationController
  def index
    @downloads = Admin::Download.page(params[:page]).per(5)
  end
end
