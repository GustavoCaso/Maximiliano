class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  validates_presence_of :name, :email, :address, :city, :postcode
  validates_format_of :email, with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  after_create :set_number

  SHIPPING_PRICE = 7


  def check_stock(cart)
    cart.line_items.select { |item| not item.size.stock? }
  end

  def update_stock
    line_items.each do |line_item|
      s = line_item.size
      line_item.size.stock -= line_item.quantity
      s.save
    end
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      line_items << item
    end
  end

  def total
    line_items.to_a.sum{|line_item| line_item.size.price * line_item.quantity.to_f} + SHIPPING_PRICE
  end

  def set_payment_token token
    update_attribute(:token,token)
  end

  def payment_params

    items = line_items.map do |item|
      {
        :name => item.size.product.name,
        :description => item.size.size,
        :amount => item.size.price,
        :quantity => item.quantity
      }
    end
  end

  private
    def set_number
      self.number = Order.all.order(:number).last.number + 1
    end

end
