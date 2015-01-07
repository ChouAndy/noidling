class LawsController < ApplicationController
  def index
    @laws = Admin::Law.all
  end
end
