class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 2..500 }

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products

  def friendly_updated_at
    updated_at.strftime("%D")
  end

  def is_discounted?
    if price < 3000
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
