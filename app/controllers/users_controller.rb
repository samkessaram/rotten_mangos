class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcom aboard, #{@user.firstname}."
    else
      render :new
    end
  end

  protected

  def user_params
    params.requre(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end
