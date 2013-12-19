class Size < ActiveRecord::Base
  belongs_to :product
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates_numericality_of :price, :stock, :discount

  def stock?
   not stock.to_i.zero?
  end

  def price_after_discount
    return price unless discount
    price * (1-(discount/100.00))
  end

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
