class Admin::KnowledgesController < ApplicationController
  before_action :require_login
  before_action :set_admin_knowledge, only: [:show, :edit, :update, :destroy]

  def index
    @admin_knowledges = Admin::Knowledge.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @admin_knowledge = Admin::Knowledge.new
  end

  def edit
  end

  def create
    @admin_knowledge = Admin::Knowledge.new(admin_knowledge_params)

    if @admin_knowledge.save
      redirect_to @admin_knowledge
    else
      render :new
    end
  end

  def update
    if @admin_knowledge.update(admin_knowledge_params)
      redirect_to @admin_knowledge
    else
      render :edit
    end
  end

  def destroy
    @admin_knowledge.destroy
    redirect_to admin_knowledges_url
  end

  private
    def set_admin_knowledge
      @admin_knowledge = Admin::Knowledge.find(params[:id])
    end

    def admin_knowledge_params
      params.require(:admin_knowledge).permit(:question, :answer)
    end
end
