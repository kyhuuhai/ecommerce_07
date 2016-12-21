class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = t"profile_updated"
      redirect_to @user
    else
      redirect_to :edit
    end
  end

  def create
    @user = User.new(user_params)
  	if(@user.save)
	  redirect_to root_path
	  log_in @user
	  flash[:success] = t"register_sucess"
  	else
  	  redirect_to register_path
  	end
  end

  private
  	def set_user
  		@user = User.find(params[:id])
  	end

  	def user_params
    	params.require(:user).permit(:name, :email,:password,:password_confirmation)
  	end
end
