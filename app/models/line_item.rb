class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :size
  belongs_to :order

  def total_price
    size.price * quantity
  end
end
