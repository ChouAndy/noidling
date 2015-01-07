class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_counters

  protected

  def set_counters
    @counters = Admin::Counter.first
    if params['controller'] == 'welcome'
      @counters.number += 1
      @counters.save
    end
  end
end
