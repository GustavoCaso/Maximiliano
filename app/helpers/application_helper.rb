module ApplicationHelper
  def outlet?
    Product.all.map{|product| product.outlet?}.any?
  end
end
