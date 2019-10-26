class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_line_item, only: [:update, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @cart = @current_user.carts.last
  
    @line_item = @cart.add_product(@product, @cart)
  
    if @line_item.save
      flash[:notice] = "Item added to the cart"
      redirect_to cart_path(@cart)
    else
      flash[:alert] = "Try again"
      render "users/new"
    end
  end

  def destroy
    @cart = current_user.carts.last
    @line_item.destroy
    flash[:notice] =  'Item successfully removed'
    redirect_to cart_path(@cart)
  end

  private

  def find_line_item
    @line_item = LineItem.find(params[:id])
  end
end
