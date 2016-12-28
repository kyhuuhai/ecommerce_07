class ProductsController < ApplicationController
  before_action :load_product

  def show
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
