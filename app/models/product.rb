class Product < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%D")
  end

  def is_discounted?
    if price.to_i <= 1000
    end
  end
end
