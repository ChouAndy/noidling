class KnowledgesController < ApplicationController
  def index
    @knowledges = Admin::Knowledge.all
  end

  def show
    @knowledge = Admin::Knowledge.find(params[:id])
  end
end
