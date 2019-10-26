class User < ApplicationRecord
  has_secure_password
  has_many :payments, dependent: :nullify
  has_many :carts, dependent: :nullify
  has_many :products, dependent: :destroy

  after_create :create_cart

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def create_cart
    Cart.create(user_id: self.id)
  end
end
