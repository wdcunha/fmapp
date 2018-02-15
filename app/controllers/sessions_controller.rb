class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password_digest])
      session[:user_id] = user.id

      flash[:notice] = "Welcome #{user.first_name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Wrong email or password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: 'Signed out!'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password_digest)
  end
end
