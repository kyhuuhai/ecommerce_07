class StaticPagesController < ApplicationController
  before_action :load_category , only: :home

  def home
    @categories = Category.all
    @cartdetails = current_cart.cartdetails.new
  end

  private
  def load_category
    @category = Category.find_by id: params[:category_id]
    if @category.nil?
      @products = Product.all
    else
      @products = @category.products
    end
  end
end
