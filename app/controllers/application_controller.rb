class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_switch

  protect_from_forgery with: :exception

  SIZES = ["XS", "S", "M", "G", "XG"]

  def set_switch
    @switch = params[:action]
  end
end
