class CartsController < ApplicationController
  before_action :load_cart_and_cartdetails, only: [:show, :update]

  def show
  end

  def update
    if @cart.status.nil?
      @cart.update_column(:status, false)
    else
      @cart.update_column(:status, nil)
    end
    redirect_to @cart
  end

  def destroy
  end

  private
  def load_cart_and_cartdetails
    @cartdetails = current_cart.cartdetails
    @cart = current_cart
  end
end
