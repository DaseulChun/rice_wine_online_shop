class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:sessions][:email]

    if @user&.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to products_path
    else
      flash[:alert] = "Wrong email or password"
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
