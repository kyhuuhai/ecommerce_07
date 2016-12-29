class CartdetailsController < ApplicationController
  before_action :get_current_cart
  before_action :set_cartdetail, only: [:update, :destroy]

  def create
    @cart.user = current_user
    if !@cart.cartdetails.exists? product_id: cart_detail_params[:product_id]
      @cartdetail = @cart.cartdetails.new cart_detail_params
    else
      @cartdetail = @cart.cartdetails.find_by_product_id cart_detail_params[:product_id]
      @cartdetail.increment! :quantity
    end
    @cart.update_column(:status, nil)
    @cart.save
  end

  def update
    @cartdetail.update_attributes cart_detail_params
    @cartdetails = @cart.cartdetails
  end

  def destroy
    @cartdetail.destroy
    @cartdetails = @cart.cartdetails
  end

  private
  def get_current_cart
    @cart = current_cart
  end

  def get_cartdetails
    @cartdetails = @cart.cartdetails
  end

  def set_cartdetail
    @cartdetail = @cart.cartdetails.find params[:id]
  end

  def cart_detail_params
    params.require(:cartdetail).permit :quantity, :product_id
  end
end
