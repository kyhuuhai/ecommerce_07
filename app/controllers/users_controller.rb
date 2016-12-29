class UsersController < ApplicationController
  before_action :load_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = t"profile_updated"
      redirect_to @user
    else
      redirect_to :edit
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t"register_sucess"
      log_in @user
      redirect_to root_path
    else
      redirect_to register_path
    end
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "user_not_found"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
