class ApplicationController < ActionController::Base
  before_action :get_current_cart

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    unless user_signed_in?
      flash[:danger] = "Please sign in first"
      redirect_to new_session_path
    end
  end

  def get_current_cart
    if user_signed_in?
      @current_cart = current_user.carts.last
    end
  end
  helper_method :get_current_cart

  def count_cart_item_totals
    total = @current_cart.line_items.map(&:quantity).sum
    return total
  end
  helper_method :count_cart_item_totals
end
