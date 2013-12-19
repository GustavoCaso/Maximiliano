class NoStock < ActionMailer::Base
  default from: "paloma@maximilianodeyork.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.no_stock.without_stock.subject
  #
  def without_stock(product)
    @product = product

    mail to: "paloma@maximilianodeyork.com", subject: "Producto #{product.name} sin stock"
  end
end
