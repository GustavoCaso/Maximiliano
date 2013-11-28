class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def check_stock(cart)
    cart.line_items.select { |item| not item.size.stock? }
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      item.stock -= 1
      line_items << item
    end
  end
end
