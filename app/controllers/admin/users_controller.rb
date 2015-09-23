class Admin::UsersController < ApplicationController

  # def new
  # end

  # def create
  # end

  def active
    #ideally would do this instead of "create." need help with custom routing
  end

  def new
    if params[:yes] || session[:admin] == true
      session[:admin] = true
      redirect_to movies_path, notice: "Logged in as Admin."
    else
      redirect_to movies_path, notice: "Logged in as User."
    end
  end

end
