class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize!, except: [:index, :show]

  def index
    @products = Product.order(created_at: :desc)
  end

  def show
    
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new product_params
    @product.user = current_user

    if @product.save
      redirect_to product_path(@product)
    else
      flash[:alert] = "Try again"
      render :new
    end
  end

  def edit
    
  end

  def update
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Product deleted!"
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end

  def find_product
    @product = Product.find params[:id]
  end

  def authorize!
    redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @product)
  end
end
