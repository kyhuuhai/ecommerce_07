class Admin::BaseController < ApplicationController
  before_filter :require_login

  private
  def require_login
    unless logged_in? && current_user.is_admin?
      flash[:danger] = t "admin_denied"
      redirect_to root_url
    end
  end
end
