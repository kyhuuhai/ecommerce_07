class ProductsController < ApplicationController
  before_action :load_product

  def show
    @top_new_product = Product.top_new_product.limit Settings.top_new_product
    @top_order_product = Product.is_ordered.order_number.limit Settings.top_order
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "product_not_found"
      redirect_to root_url
    end
  end
end
