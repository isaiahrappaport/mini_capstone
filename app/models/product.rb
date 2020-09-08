class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 2..500 }

  def friendly_updated_at
    updated_at.strftime("%D")
  end

  def is_discounted?
    if price <= 1000
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
