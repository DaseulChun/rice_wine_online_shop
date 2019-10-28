class CartsController < ApplicationController
  before_action :find_cart
  
  def show
  
  end

  def destroy
    @cart.line_items.delete_all
    flash[:notice] = "Cart has been emptied successfully"
    redirect_to cart_path(@cart)
  end

  private

  def find_cart
    @cart = Cart.find params[:id]
  end
end
