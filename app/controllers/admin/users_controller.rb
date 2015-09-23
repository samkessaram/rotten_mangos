class Admin::UsersController < ApplicationController

  def new
  end

  def edit
    
  end

  def create
    if params[:yes] || session[:admin] == true
      session[:admin] = true
      redirect_to movies_path, notice: "Logged in as Admin."
    else
      redirect_to movies_path, notice: "Logged in as User."
    end
  end

end
