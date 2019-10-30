class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = Cart.find params[:cart_id]
    charge = Stripe::Charge.create({
      amount: (@cart.total_price * 100).to_i,
      currency: 'cad',
      source: params[:stripe_token],
      description: "Charge for Cart #{@cart.id} by #{current_user.full_name} (#{current_user.id})"
    })
    @payment = Payment.new txn_id: charge.id,
                            amount: @cart.total_price,
                            cart_id: @cart.id
    @payment.user = current_user
    current_user.create_cart
    if @payment.save
      redirect_to products_path, notice: 'Thanks for completing the payment'
    else
      redirect_to root_path, notice: 'Cart is NOT created'
    end
    rescue => e
      puts "ERROR #{e.message}"
      flash.now[:alert] = 'Problem handling the payment, please try again.'
      render "products/index"
    end
end
