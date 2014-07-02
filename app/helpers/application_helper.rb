module ApplicationHelper
  def outlet?
    Product.exists?(outlet: true)
  end
end
