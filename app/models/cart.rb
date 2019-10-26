class Cart < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items, source: :product

  def add_product(product, cart)
    current_item = LineItem.find_by(product_id: product.id, cart_id: cart.id)

    if current_item&.valid?
      current_item.increment(:quantity)
    else
      current_item = LineItem.new(product_id: product.id, cart_id: cart.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
