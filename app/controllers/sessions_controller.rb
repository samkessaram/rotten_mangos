class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if admin?
        redirect_to admin_users_path, notice: "Hi, #{@user.firstname}."
      else
        redirect_to movies_path, notice: "Welcome back, #{@user.firstname}!"
      end
    else
      flash.now[:alert] = "Log in failed. Balls."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:admin] = nil
    redirect_to movies_path, notice: "Thanks for stopping by."
  end

  def admin?
    @user.admin
  end

end
