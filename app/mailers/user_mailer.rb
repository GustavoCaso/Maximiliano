class UserMailer < ActionMailer::Base
  default from: "paloma@maximilianodeyork.com"

  def send_email(size)
    mail(to: "paloma@maximilianodeyork.com", subject: " El #{size.product.name} sin stock")
  end
end