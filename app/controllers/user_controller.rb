class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      redirect_to "/pictures"
    else
      render :new
  end

    private

  def user_params
    { email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation] }
  end

end
