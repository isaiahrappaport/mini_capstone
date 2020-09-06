class Product < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%D")
  end

  def is_discounted?
    if price <= 1000
    end
  end
end
