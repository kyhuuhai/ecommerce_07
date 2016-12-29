class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  include SessionsHelper

  def current_cart
    if logged_in? && !Cart.find_by_user_id(current_user.id).nil?
      Cart.find_by_user_id(current_user.id)
    else
      Cart.new
    end
  end
end
