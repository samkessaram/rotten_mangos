class Admin::UsersController < ApplicationController

    # def new
    # end

    # def create
    # end

  def show
    if session[:admin]
      @users = User.all.page(params[:page]).per(10)
    else
      redirect_to movies_path, notice: "You must be logged in as Admin to access that page."
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.delete_email(@user).deliver_now
    @user.destroy
    redirect_to admin_users_path
  end
end

      