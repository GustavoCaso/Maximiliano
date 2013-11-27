class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy


  def total_price
    line_items.sum{|line_item| line_item.total_price}
  end

  def add_product(size_id)
    current_item = line_items.find_by(size_id: size_id)

    if current_item
      current_item.quantity +=1
    else
      current_item = line_items.build(size_id: size_id)
    end
    current_item
  end
end
