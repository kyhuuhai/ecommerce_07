class Admin::CartdetailsController < Admin::BaseController
  before_action :load_cart, only: :show

  def show
    @cartdetails = @cart.cartdetails
    @cartdetails = @cart.cartdetails.paginate page: params[:page],
      per_page: Settings.per_page.carts
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
