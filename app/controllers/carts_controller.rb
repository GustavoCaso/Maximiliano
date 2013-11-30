class CartsController < ApplicationController


  def show
    @cart= Cart.find(session[:cart_id])
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path, alert: "Tu Carrito ha sido Borrado"
  end
end