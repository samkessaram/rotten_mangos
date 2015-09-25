class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    admin = params[:admin]
    @user = User.new(user_params)
    
    if admin == "true"
      @user.update(admin: true)
    end

    if @user.save
      if session[:admin]
        redirect_to movies_path, notice: "User #{@user.firstname} #{@user.lastname} successfully created."
      else
        session[:user_id] = @user.id
        redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}."
      end
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
