class Product < ApplicationRecord
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
