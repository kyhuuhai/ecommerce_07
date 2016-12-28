class Admin::CartsController < Admin::BaseController
  before_action :load_cart, only: [:update, :destroy]

  def index
    @carts = Cart.created_order.paginate page: params[:page],
      per_page: Settings.per_page.carts
  end

  def destroy
    if @cart.destroy
      flash[:success] = t "delete"
    else
      flash[:success] = t "delete_error"
    end
    redirect_to admin_carts_path
  end

  private
  def load_cart
    @cart = Cart.find_by id: params[:id]
    unless @cart
      flash[:danger] = t "not_found"
      redirect_to admin_carts_path
    end
  end
end
