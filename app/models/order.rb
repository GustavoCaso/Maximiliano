class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  validates_presence_of :name, :email, :address, :city, :postcode

  def check_stock(cart)
    cart.line_items.select { |item| not item.size.stock? }
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      line_items << item
    end
  end
  
  def total
    line_items.sum{|line_item| line_item.size.price}
  end
  
  def payment_params
    items = line_items.map do |item|
      {
        :name => item.size.product.name,
        :description => item.size.size,
        :amount => item.size.price,
        :category => :Digital
      }
    end
  end
end
