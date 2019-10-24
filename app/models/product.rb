class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :line_items, dependent: :destroy
  has_many :carts, through: :line_items, source: :cart

  validates( :title, 
            presence: true, 
            uniqueness: { case_sensitive: false }
  )
  validates( :description, 
            presence: { message: "must exist" }, 
            length: { minimum: 5 }
  )
  validates( :price, 
            presence: true, 
            numericality: { greater_than: 0 }
  )

  before_save :capitalize_the_product

  private

  def capitalize_the_product
    self.title.capitalize!
  end
end
