class Admin::UsersController < ApplicationController

    # def new
    # end

    # def create
    # end

  def show
    @users = User.all.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.delete_email(@user).deliver_now
    @user.destroy
    redirect_to admin_users_path
  end
end

      