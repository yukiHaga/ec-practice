class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save!
      redirect_to "login"
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
