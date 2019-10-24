class User < ApplicationRecord
  has_secure_password
  has_one :cart
  has_many :products, dependent: :destroy

  after_create :create_cart

  def full_name
    "#{first_name} #{last_name}".strip
  end

  private

  def create_cart
    Cart.create(user_id: self.id)
  end
end
