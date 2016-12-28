class Admin::UsersController < Admin::BaseController
  before_action :load_user, except: [:new, :create , :index]

  def new
    @user = User.new
  end

  def index
    @users = User.order_by_name.paginate page: params[:page],
      per_page: Settings.per_page.admin_users
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "add_user_succeed"
      redirect_to admin_users_path
    else
      flash[:danger] = t "add_user_failed"
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = t"profile_updated"
      redirect_to admin_users_path
    else
      flash[:danger] = t"profile_update_failed"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
    else
      flash[:success] = t "user_delete_error"
    end
    redirect_to admin_users_path
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "not_found"
      redirect_to admin_users_path
    end
  end

  def user_params
    params.require(:user).permit :name, :email,:password,:password_confirmation
  end
end
