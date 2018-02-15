class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id

      flash[:success] = "Thank you for signing up #{@user.first_name}!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User changed successfully!'
      redirect_to user_path(@user)
    end
  end

  private

  def find_user
      @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :address,
      :password_digest,
      :password_confirmation
    )
  end
end
