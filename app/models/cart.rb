class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy


  def total_price
    line_items.sum{|line_item| line_item.total_price} + Order::SHIPPING_PRICE
  end

  def add_product(size_id)
    current_item = line_items.find_or_initialize_by(size_id: size_id)

    if !current_item.new_record?
      current_item.quantity +=1
    end

    current_item
  end
end
